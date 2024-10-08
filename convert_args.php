<?php
require 'Lib/vendor/autoload.php';
use \Done\Subtitles\Subtitles;

var_dump($argv);

$formatsMap = [
    'srt' => 'srt',
    'vtt' => 'vtt',
    'scc' => 'scc',
    'ebu_stl' => 'stl',
    'stl' => 'stl',
    'sbv' => 'sbv',
    'sub_subviewer' => 'sub',
    'sub_microdvd' => 'sub_m',
    'ass' => 'ass',
    'dfxp' => 'dfxp',
    'ttml' => 'ttml',
    'smi' => 'smi',
    'txt_quicktime' => 'qt.txt',
    'rtf' => 'rtf',
    'docx' => 'docx',
    'lrc' => 'lrc',
    'csv' => 'csv',
    'txt' => 'txt'
];

if ($argc > 2) {
    $inputFile = $argv[1];
    $extensions = array_slice($argv, 2);
    
    $inputFolder = pathinfo($inputFile, PATHINFO_DIRNAME);

    foreach ($extensions as $extension) {
        $outputFile = $inputFolder . DIRECTORY_SEPARATOR . pathinfo($inputFile, PATHINFO_FILENAME) . '.' . $extension;
        Subtitles::convert($inputFile, $outputFile);
        echo "Conversion finished: $outputFile\n";

        if (array_key_exists($extension, $formatsMap)) {
            $realExtension = $formatsMap[$extension];
            $newOutputFile = $inputFolder . DIRECTORY_SEPARATOR . pathinfo($inputFile, PATHINFO_FILENAME) . '.' . $realExtension;

            if (rename($outputFile, $newOutputFile)) {
                echo "File renamed to: $newOutputFile\n";
            } else {
                echo "Error renaming file: $outputFile\n";
            }
        } else {
            echo "Unsupported format: $extension\n";
        }
    }
} else {
    echo "Not enough arguments provided. Usage: php script.php <input_file> <extension1> <extension2> ...\n";
}
