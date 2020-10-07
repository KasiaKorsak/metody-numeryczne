package edu.kasia;

import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.control.Label;

import java.awt.*;

public class CosinusFX extends Application {

    private TextField tendField;
    private TextField fField;
    private TextField nField;

    Button btnDraw;

    LineChart<Number,Number> figure;


    @Override
    public void start(Stage primaryStage) throws Exception {

        primaryStage.setTitle("Cosinus");


        VBox layout = new VBox();
        layout.setSpacing(10);
        //layout.setPadding(20,20,30,30);

        Label t = new Label("tend: ");
        Label n = new Label("n: ");
        Label f = new Label("f: ");

        tendField = new TextField();
        tendField.setText("10");
        tendField.setPrefWidth(80);
        fField = new TextField();
        fField.setText("1");
        fField.setPrefWidth(80);
        nField = new TextField();
        nField.setText("100");
        nField.setPrefWidth(80);

       HBox hbox = new HBox(t,tendField,n,nField,f,fField);
       // HBox hbox = new HBox(10);
       // hbox.getChildren().addAll(t,tendField,n,nField,f,fField);
        hbox.setAlignment(Pos.CENTER);

        layout.getChildren().add(hbox);

        btnDraw = new Button("Draw");
        btnDraw.setPrefWidth(200);
        btnDraw.setOnAction(e->{
            double time = Double.parseDouble(tendField.getText());
            int nn = Integer.parseInt(nField.getText());
            double ff = Double.parseDouble(fField.getText());
            Cosinus cos = new Cosinus(time,ff,nn);

            figure.setCreateSymbols(false);
            figure.getData().clear();
            XYChart.Series data = cos.getValues();
            data.setName("Test");
            figure.setLegendVisible(false);
            figure.getData().add(data);

        });

        HBox hbox2 = new HBox(btnDraw);
        hbox2.setAlignment(Pos.CENTER);
        layout.getChildren().add(hbox2);

        NumberAxis x = new NumberAxis();
        x.setLabel("time");
        NumberAxis y = new NumberAxis();
        y.setLabel("value");
        figure = new LineChart<Number, Number>(x,y);

        layout.getChildren().add(figure);


        Scene scene = new Scene(layout,500,500);

        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }

}
