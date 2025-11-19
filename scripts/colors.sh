#!/usr/bin/env bash

echo "=== Cores ANSI Básicas ==="
for color in {30..37}; do
    echo -e "\e[${color}m# Cor $color\e[0m"
done

echo ""
echo "=== Cores ANSI de Fundo ==="
for color in {40..47}; do
    echo -e "\e[${color}m                \e[0m"
done

echo ""
echo "=== Cores Brilhantes ==="
for color in {90..97}; do
    echo -e "\e[${color}m# Brilhante $color\e[0m"
done

echo ""
echo "=== Fundos Brilhantes ==="
for color in {100..107}; do
    echo -e "\e[${color}m                 \e[0m"
done
