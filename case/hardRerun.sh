#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для перезапуска расчёта с нуля

# Копирование файлов начальных условий без изменений из папки Orig
cp -r 0/Orig/*.orig 0/

# Копирование файлов сетки
cp -r ../mesh/constant/polyMesh constant
refineMesh -overwrite | tee case.log

# Запуск расчёта и запись постпроцессинга
potentialFoam | tee -a case.log
# multicompCompressFluid | tee -a case.log

foamToVTK | tee -a case.log # конвертирование решенной задачи в формат VTK

echo -ne '\007' # звуковой сигнал при выполнении задачи