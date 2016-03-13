/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uniminuto.web.jsf.beans;

import com.uniminuto.web.modelo.PieChartData;
import com.uniminuto.web.modelo.PieChartData.KeyValue;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.event.ValueChangeEvent;
import javax.inject.Named;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author fercris
 */
@SessionScoped
@Named
public class DatosGraficoJSFBean implements Serializable {

    private PieChartModel pieDatosAreaPaises;
    private BarChartModel barDatosPaises;
    LineChartModel lineChartModel;

    private boolean mostrarTorta;

    public boolean isMostrarBarra() {
        return mostrarBarra;
    }

    public void setMostrarBarra(boolean mostrarBarra) {
        this.mostrarBarra = mostrarBarra;
    }

    public boolean isMostrarLinea() {
        return mostrarLinea;
    }

    public void setMostrarLinea(boolean mostrarLinea) {
        this.mostrarLinea = mostrarLinea;
    }
    private boolean mostrarBarra;
    private boolean mostrarLinea;

    List<KeyValue> pieDataList = new ArrayList<>();

    public List<PieChartData.KeyValue> getPieDataList() {
        return pieDataList;
    }

    public void chkTorta_VCE(ValueChangeEvent vce) {
        mostrarTorta = Boolean.valueOf(String.valueOf(vce.getNewValue()));
    }
      public void chkBarra_VCE(ValueChangeEvent vce) {
        mostrarBarra = Boolean.valueOf(String.valueOf(vce.getNewValue()));
    }
        public void chkLinea_VCE(ValueChangeEvent vce) {
        mostrarLinea = Boolean.valueOf(String.valueOf(vce.getNewValue()));
    }

    @PostConstruct
    public void init() {
        mostrarTorta = true;
        pieDatosAreaPaises = new PieChartModel();
        barDatosPaises = new BarChartModel();
        lineChartModel = new LineChartModel();
        ChartSeries areaPaises = new ChartSeries("Areas");
        pieDataList = PieChartData.getPieDataList();
        for (KeyValue keyValue : pieDataList) {
            pieDatosAreaPaises.set(keyValue.getKey(), Long.valueOf(keyValue.getValue()));
            areaPaises.set(keyValue.getKey(), Long.valueOf(keyValue.getValue()));
        }

        pieDatosAreaPaises.setTitle("Area por países");
        pieDatosAreaPaises.setLegendPosition("w");
        pieDatosAreaPaises.setShowDataLabels(true);
        pieDatosAreaPaises.setShowDatatip(true);

        barDatosPaises.addSeries(areaPaises);

        barDatosPaises.setTitle("Area paises");
        barDatosPaises.setLegendPosition("ne");
        barDatosPaises.setAnimate(true);

        lineChartModel.addSeries(areaPaises);

        Axis xAxisL = lineChartModel.getAxis(AxisType.X);
        xAxisL.setLabel("País");

        Axis yAxisL = lineChartModel.getAxis(AxisType.Y);
        yAxisL.setLabel("Area");

        Axis xAxis = barDatosPaises.getAxis(AxisType.X);
        xAxis.setLabel("País");

        Axis yAxis = barDatosPaises.getAxis(AxisType.Y);
        yAxis.setLabel("Area");

    }

    /**
     * @return the pieDatosAreaPaises
     */
    public PieChartModel getPieDatosAreaPaises() {
        return pieDatosAreaPaises;
    }

    /**
     * @param pieDatosAreaPaises the pieDatosAreaPaises to set
     */
    public void setPieDatosAreaPaises(PieChartModel pieDatosAreaPaises) {
        this.pieDatosAreaPaises = pieDatosAreaPaises;
    }

    public LineChartModel getLineChartModel() {
        return lineChartModel;
    }

    public void setLineChartModel(LineChartModel lineChartModel) {
        this.lineChartModel = lineChartModel;
    }

    public BarChartModel getBarDatosPaises() {
        return barDatosPaises;
    }

    public void setBarDatosPaises(BarChartModel barDatosPaises) {
        this.barDatosPaises = barDatosPaises;
    }

    /**
     * @return the mostrarTorta
     */
    public boolean isMostrarTorta() {
        return mostrarTorta;
    }

    /**
     * @param mostrarTorta the mostrarTorta to set
     */
    public void setMostrarTorta(boolean mostrarTorta) {
        this.mostrarTorta = mostrarTorta;
    }
}
