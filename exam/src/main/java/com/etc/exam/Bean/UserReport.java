package com.etc.exam.Bean;

public class UserReport {

    private String name;
    private Report report;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Report getReport() {
        return report;
    }

    public void setReport(Report report) {
        this.report = report;
    }

    @Override
    public String toString() {
        return "UserReport{" +
                "name='" + name + '\'' +
                ", report=" + report +
                '}';
    }
}
