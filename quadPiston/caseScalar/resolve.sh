#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для перезапуска расчёта с нуля

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Копирование граничных условий (и проч.) из проекта с модифицированным ядром
cp -r ../case/0/T.orig 0
cp -r ../case/1/U 0
cp -r ../case/1/transportProperties constant

# Запуск расчёта и запись постпроцессинга
scalarTransportFoam | tee case.log


# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
echo -ne '\007' # звуковой сигнал при выполнении задачи




