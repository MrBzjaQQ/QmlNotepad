#ifndef TEXTEDITOR_H
#define TEXTEDITOR_H

#include <QString>
#include <QObject>


class TextEditor : public QObject
{
    Q_OBJECT
public:
    TextEditor();
    Q_INVOKABLE QString openFile();
    Q_INVOKABLE void saveFile(QString text);

};

#endif // TEXTEDITOR_H
