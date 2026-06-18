- dashboard: bank_executive_kpi_dashboard
  title: "Dashboard Zarządczy: Kondycja i Efektywność Banku"
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: "Pokazowy dashboard analityczny prezentujący 6 głównych wskaźników KPI (Rentowność, Efektywność, Ryzyko, Bezpieczeństwo) w latach 2025-2026."

  filters:
  - name: wybierz_okres
    title: "Okres danych"
    type: date_filter
    default_value: "2025/01/01 to 2026/05/31"

  elements:

# --- SEKCJA 1: RENTOWNOŚĆ (NAGŁÓWEK) ---
  - name: header_rentownosc
    type: text
    title_text: "1. Rentowność (Profitability)"
    subtitle_text: "Jak efektywnie generujemy zyski z kapitału i aktywów?"
    body_text: ""
    row: 0
    col: 0
    width: 24
    height: 2

# Kafelki Rentowności
  - name: tile_roe
    title: "ROE (Stan na koniec okresu)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: single_value
    fields: [bank_performance_kpis.kpi_roe]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 2
    col: 0
    width: 8
    height: 4

  - name: tile_roa
    title: "ROA (Stan na koniec okresu)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: single_value
    fields: [bank_performance_kpis.kpi_roa]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 2
    col: 8
    width: 8
    height: 4

  - name: tile_nim
    title: "NIM (Marża Odsetkowa Netto)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: single_value
    fields: [bank_performance_kpis.kpi_nim]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 2
    col: 16
    width: 8
    height: 4

# Wykres Trendu Rentowności
  - name: chart_trend_rentownosci
    title: "Ewolucja Wskaźników Rentowności (ROE, ROA, NIM)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: looker_line
    fields: [bank_performance_kpis.data_biznesowa_month, bank_performance_kpis.kpi_roe, bank_performance_kpis.kpi_roa, bank_performance_kpis.kpi_nim]
    sorts: [bank_performance_kpis.data_biznesowa_month]
    colors: ["#1F4E79", "#2E75B6", "#BDD7EE"] # Paleta odcieni niebieskich dla spójności
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    series_types:
      bank_performance_kpis.kpi_roe: line
      bank_performance_kpis.kpi_roa: area
      bank_performance_kpis.kpi_nim: line
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 6
    col: 0
    width: 24
    height: 8


# --- SEKCJA 2: EFEKTYWNOŚĆ, RYZYKO I BEZPIECZEŃSTWO (NAGŁÓWEK) ---
  - name: header_efektywnosc_bezpieczenstwo
    type: text
    title_text: "2. Efektywność Operacyjna, Jakość Portfela i Stabilność"
    subtitle_text: "Monitorowanie dyscypliny kosztowej (C/I), poziomu złych długów (NPL) oraz adekwatności kapitałowej (TCR)"
    row: 14
    col: 0
    width: 24
    height: 2

# Kafelki Efektywności i Bezpieczeństwa
  - name: tile_ci
    title: "C/I Ratio (Koszt / Dochód)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: single_value
    fields: [bank_performance_kpis.kpi_cost_to_income]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 16
    col: 0
    width: 8
    height: 4

  - name: tile_npl
    title: "NPL Ratio (Kredyty Zagrożone)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: single_value
    fields: [bank_performance_kpis.kpi_npl]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 16
    col: 8
    width: 8
    height: 4

  - name: tile_tcr
    title: "TCR / CAR (Wsp. Wypłacalności)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: single_value
    fields: [bank_performance_kpis.kpi_tcr]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 16
    col: 16
    width: 8
    height: 4

# Zaawansowane Wykresy Porównawcze
  - name: chart_ci_operacje
    title: "Struktura Przychody vs Koszty (Analiza Nożyc Finansowych)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: looker_column
    fields: [bank_performance_kpis.data_biznesowa_month, bank_performance_kpis.total_przychody_operacyjne, bank_performance_kpis.total_koszty_dzialania]
    sorts: [bank_performance_kpis.data_biznesowa_month]
    colors: ["#2E75B6", "#A6A6A6"] # Przychody jasnoniebieskie, Koszty neutralne szare
    stacking: "" # Kolumny obok siebie dla widoczności luki dochodowej
    show_value_labels: false
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 20
    col: 0
    width: 12
    height: 8

  - name: chart_npl_vs_tcr
    title: "Bezpieczeństwo: Stabilność Bufora Kapitałowego (TCR) względem Ryzyka (NPL)"
    model: twój_model_banku
    explore: bank_performance_kpis
    type: looker_line
    fields: [bank_performance_kpis.data_biznesowa_month, bank_performance_kpis.kpi_tcr, bank_performance_kpis.kpi_npl]
    sorts: [bank_performance_kpis.data_biznesowa_month]
    colors: ["#1F4E79", "#C00000"] # TCR stabilny ciemnoniebieski, NPL jako linia ryzyka - czerwona
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_x_axis_label: false
    # Użycie dwóch osi Y, ponieważ TCR i NPL mają różne skale wielkości
    y_axes: [{
      label: "TCR Scale",
      orientation: left,
      series: [{id: bank_performance_kpis.kpi_tcr}]
    }, {
      label: "NPL Scale",
      orientation: right,
      series: [{id: bank_performance_kpis.kpi_npl}]
    }]
    listen:
      wybierz_okres: bank_performance_kpis.data_biznesowa_date
    row: 20
    col: 12
    width: 12
    height: 8
