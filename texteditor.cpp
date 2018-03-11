#include "texteditor.h"
#include <QTextStream>
#include <QFileDialog>
#include <QFile>

TextEditor::TextEditor()
{

}

QString TextEditor::openFile()
{
    QString path = QFileDialog::getOpenFileName(NULL, "Please choose necessary file", "", "Текстовый документ (*.txt)");
    QFile file(path);
    QString text;
    if(file.open(QIODevice::ReadOnly)){
        QTextStream stream(&file);
        text = stream.readAll();
    }
    else
        text = "error";
    return text;
}

void TextEditor::saveFile(QString text)
{
    QString path = QFileDialog::getSaveFileName(NULL, QObject::tr("Choose the directory to save this file"), "", QObject::tr("Текстовый документ (*.txt)"));
    QFile file(path);
    if(file.open(QIODevice::WriteOnly)){
        QTextStream stream(&file);
        stream << text;
    }
}
