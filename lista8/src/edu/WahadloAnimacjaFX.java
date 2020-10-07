package edu;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.ScatterChart;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import java.util.ArrayList;


public class WahadloAnimacjaFX extends Application {


    private TextField t0Field;
    private TextField tendField;
    private TextField hField;
    private TextField aField;
    private TextField cField;
    private TextField fField;
    private TextField omega0Field;
    private TextField theta0Field;

    Button btnDraw;
    Button btnClear;
    Button btnAnimation;
    Button btnSetParam;


    WahadloAnimacja wahadlo;

    LineChart<Number, Number> figure;

    LineChart<Number, Number> figure2;

    ScatterChart<Number, Number> figure3;

    @Override
    public void start(Stage primaryStage) throws Exception {

        primaryStage.setTitle("Wahadlo");


        wahadlo = new WahadloAnimacja();

        VBox layout = new VBox();
        layout.setSpacing(30);
        layout.setPadding(new Insets(20, 20, 30, 30));

        Label tend = new Label("tend: ");
        Label f = new Label("f: ");
        Label a = new Label("A: ");
        Label h = new Label("h: ");
        Label c = new Label("c: ");
        Label omega0 = new Label("omega0: ");
        Label theta0 = new Label("theta0: ");
        Label t0 = new Label("t0: ");

        tendField = new TextField();
        //tendField.setText("10");
        tendField.setPrefWidth(80);
        tendField.setEditable(false);
        aField = new TextField();
        //aField.setText("0.5");
        aField.setPrefWidth(80);
        aField.setEditable(false);
        fField = new TextField();
        //fField.setText("1");
        fField.setPrefWidth(80);
        fField.setEditable(false);
        t0Field = new TextField();
        //t0Field.setText("0");
        t0Field.setPrefWidth(80);
        t0Field.setEditable(false);
        hField = new TextField();
       // hField.setText("0.01");
        hField.setPrefWidth(80);
        hField.setEditable(false);
        cField = new TextField();
        //cField.setText("0.5");
        cField.setPrefWidth(80);
        cField.setEditable(false);
        omega0Field = new TextField();
        //omega0Field.setText("0");
        omega0Field.setPrefWidth(80);
        omega0Field.setEditable(false);
        theta0Field = new TextField();
        //theta0Field.setText("5");
        theta0Field.setPrefWidth(80);
        theta0Field.setEditable(false);

        HBox hbox1 = new HBox(a, aField, c, cField, f, fField);

        hbox1.setAlignment(Pos.CENTER);
        hbox1.setSpacing(10);

        layout.getChildren().add(hbox1);

        HBox hbox2 = new HBox(t0, t0Field, tend, tendField, theta0, theta0Field, omega0, omega0Field, h, hField);

        hbox2.setAlignment(Pos.CENTER);
        hbox2.setSpacing(10);

        layout.getChildren().add(hbox2);

        btnSetParam = new Button("Set parameters");
        btnSetParam.setPrefWidth(200);
        btnSetParam.setOnAction(e -> {
            wahadlo.display();
            updateParam();
        });


        btnDraw = new Button("Draw");
        btnDraw.setPrefWidth(200);
        btnDraw.setOnAction(e -> {
            double tstop = Double.parseDouble(tendField.getText());
            double ff = Double.parseDouble(fField.getText());
            double aa = Double.parseDouble(aField.getText());
            double cc = Double.parseDouble(cField.getText());
            double theta = Double.parseDouble(theta0Field.getText()) * Math.PI / 180;
            double tstart = Double.parseDouble(t0Field.getText());
            double hh = Double.parseDouble(hField.getText());
            double omega = Double.parseDouble(omega0Field.getText());

            WahadloAnimacja wahadlo = new WahadloAnimacja(aa, ff, cc, theta, tstart, hh, tstop, omega);

            ArrayList<XYChart.Series> data = wahadlo.getValues();
            ArrayList<ScatterChart.Series> data2 = wahadlo.getValues();

            figure.setCreateSymbols(false);
            figure.getData().clear();
            figure.setLegendVisible(false);
            figure.getData().add(data.get(0));

            figure2.setCreateSymbols(false);
            figure2.getData().clear();
            figure2.setLegendVisible(false);
            figure2.getData().add(data.get(1));

            figure3.setLegendVisible(false);
            figure3.getData().clear();
            figure3.getData().add(data2.get(2));
        });

        btnClear = new Button("Clear");
        btnClear.setPrefWidth(200);
        btnClear.setOnAction(e -> {

            figure.getData().clear();
            figure2.getData().clear();
            figure3.getData().clear();

        });

        btnAnimation = new Button("Animation");
        btnAnimation.setPrefWidth(200);
        btnAnimation.setOnAction(e -> {

            wahadlo.drawAnimation();
        });

        HBox hbox3 = new HBox(btnSetParam, btnDraw, btnClear, btnAnimation);
        hbox3.setSpacing(20);
        hbox3.setAlignment(Pos.CENTER);
        layout.getChildren().add(hbox3);

        NumberAxis x = new NumberAxis();
        x.setLabel("time [s]");
        NumberAxis y = new NumberAxis();
        y.setLabel("theta [rad]");

        figure = new LineChart<Number, Number>(x, y);


        NumberAxis x2 = new NumberAxis();
        x2.setLabel("time [s]");
        NumberAxis y2 = new NumberAxis();
        y2.setLabel("omega [rad/s]");

        figure2 = new LineChart<Number, Number>(x2, y2);

        NumberAxis x3 = new NumberAxis();
        x3.setLabel("theta [rad]");
        NumberAxis y3 = new NumberAxis();
        y3.setLabel("omega [rad/s]");

        figure3 = new ScatterChart<Number, Number>(x3, y3);

        HBox hbox5 = new HBox(figure, figure2, figure3);
        hbox5.setAlignment(Pos.CENTER);
        layout.getChildren().add(hbox5);

        Scene scene = new Scene(layout, 1000, 600);

        primaryStage.setScene(scene);
        primaryStage.show();

    }

    public static void main(String[] args) {
        launch(args);
    }

    private void updateParam() { //wyswietla domyslne wartosci c - pobiera z konstruktora domyslnego klasy PendulumParam

        cField.setText(String.format("%.3f", wahadlo.getC()).replaceAll(",", "."));
        aField.setText(String.format("%.3f", wahadlo.getA()).replaceAll(",", "."));
        fField.setText(String.format("%.3f", wahadlo.getF()).replaceAll(",", "."));
        theta0Field.setText(String.format("%.4f", wahadlo.getTheta0()).replaceAll(",", "."));
        omega0Field.setText(Double.toString(wahadlo.getOmega0()));
        t0Field.setText(Double.toString(wahadlo.getT0()));
        tendField.setText(Double.toString(wahadlo.getTend()));
        hField.setText(String.format("%.4f", wahadlo.getH()).replaceAll(",", "."));
    }


}

