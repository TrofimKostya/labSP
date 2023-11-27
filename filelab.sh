#!/bin/bash
while true; do
    echo "Трофименков Константин, Данный скрипт предназначен для создания, перемещения и удаления файлов."
    echo "Выберите операцию: "
    echo "1. Создать файл"
    echo "2. Удалить файл"
    echo "3. Переместить файл"
    read choice
    case $choice in
        1)
            echo "Введите имя нового файла: "
            read new_file
            if [ -e "$new_file" ]; then
                echo "Ошибка: файл с именем $new_file уже существует" >&2
            else
                touch $new_file
                echo "Файл $new_file создан"
            fi
		;;
        2)
            echo "Введите имя файла для удаления: "
            read del_file
            if [ -e "$del_file" ]; then
                rm $del_file
                echo "Файл $del_file удален"
            else
                echo "Ошибка: файл с именем $del_file не существует" >&2
            fi
		;;
        3)
            echo "Введите имя файла для перемещения: "
            read move_file
            if [ -e "$move_file" ]; then
                echo "Введите путь к каталогу, в который нужно переместить файл: "
                read new_dir
                if [ ! -d "$new_dir" ]; then
                    echo "Ошибка: каталог $new_dir не существует" >&2
                else
                    mv $move_file $new_dir
                    echo "Файл $move_file перемещен в каталог $new_dir"
                fi
            else
                echo "Ошибка: файл с именем $move_file не существует" >&2
            fi
		;;
	4)
            echo "Ошибка: неверная операция" >&2
		;;
    esac

while true; do
	read -p "Скрипт завершил своё выполнение, запустить заново? [y/n]" decide
	if [ "$decide" = "y" ]; then
		break;
	elif [ "$decide" = "n" ]; then
		exit 0;
	fi
done
done
