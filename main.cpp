#include <QGuiApplication>
#include <QtQml>
#include <QApplication>
#include <QQmlApplicationEngine>
#include "texteditor.h"

int main(int argc, char *argv[])
{
        QApplication app(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   // QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<TextEditor>("com.myinc.TextEditor", 1, 0, "TextEditor");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
