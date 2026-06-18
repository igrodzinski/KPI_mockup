view: bank_performance_kpis {
  derived_table: {
    sql:
      SELECT 
        CAST(data_biznesowa AS DATE) AS data_biznesowa,
        zysk_netto,
        kapital_wlasny,
        aktywa_ogolem,
        koszty_dzialania,
        przychody_operacyjne,
        wynik_z_tytulu_odsetek,
        aktywa_dochodowe,
        kredyty_zagrozone,
        portfel_kredytowy_ogolem,
        fundusze_wlasne,
        aktywa_wazone_ryzykiem
      FROM UNNEST([
        STRUCT('2025-01-31' AS data_biznesowa, 164408760 AS zysk_netto, 10000000000 AS kapital_wlasny, 99974908023 AS aktywa_ogolem, 206203282 AS koszty_dzialania, 409177061 AS przychody_operacyjne, 260239318 AS wynik_z_tytulu_odsetek, 84978671820 AS aktywa_dochodowe, 2716503924 AS kredyty_zagrozone, 64983690215 AS portfel_kredytowy_ogolem, 13000000000 AS fundusze_wlasne, 69982435616 AS aktywa_wazone_ryzykiem),
        STRUCT('2025-02-28', 167125307, 10025000000, 100331198904, 209692812, 416020352, 279998759, 85281519068, 2493332368, 65215279287, 13038999999, 70231839232),
        STRUCT('2025-03-31', 172443306, 10049999999, 100704116898, 203314833, 416207804, 263021075, 85598499364, 2741343866, 65457675984, 13078000000, 70492881829),
        STRUCT('2025-04-30', 165141262, 10075000000, 101136680901, 201670134, 405548236, 267912878, 85966178766, 2578078149, 65738842586, 13116999999, 70795676631),
        STRUCT('2025-05-31', 162929820, 10100000000, 101622370578, 196892454, 398040380, 274894995, 86379014992, 2546929364, 66054540876, 13156000000, 71135659405),
        STRUCT('2025-06-30', 164343668, 10125000000, 102057035192, 205915812, 408809230, 261857240, 86748479913, 2573791866, 66337072874, 13194999999, 71439924634),
        STRUCT('2025-07-31', 153006788, 10149999999, 102421508970, 202969537, 391866807, 294801354, 87058282624, 2575221150, 66573980830, 13234000000, 71695056279),
        STRUCT('2025-08-31', 157574517, 10175000000, 102861679469, 200356628, 394893069, 277690723, 87432427549, 2622149500, 66860091655, 13272999999, 72003175628),
        STRUCT('2025-09-30', 154067141, 10200000000, 103124407646, 203084919, 393291267, 272040660, 87655746499, 2679941415, 67030864970, 13312000000, 72187085352),
        STRUCT('2025-10-31', 167592954, 10225000000, 103632504456, 208457015, 415361897, 270776242, 88087628788, 2643711698, 67361127896, 13350999999, 72542753119),
        STRUCT('2025-11-30', 170482967, 10250000000, 104093916925, 224202535, 434675334, 286600323, 88479829386, 2780904938, 67661046001, 13390000000, 72865741847),
        STRUCT('2025-12-31', 170089689, 10275000000, 104484374847, 195244212, 405231483, 277992414, 88811718619, 2604803876, 67914843650, 13428999999, 73139062392),
        STRUCT('2026-01-31', 177329039, 10300000000, 104777735457, 213963950, 432888690, 277191357, 89061075139, 2661931542, 68105528047, 13468000000, 73344414820),
        STRUCT('2026-02-28', 181564731, 10325000000, 105208539216, 209397648, 433551638, 303583612, 89427258334, 2637199641, 68385550490, 13506999999, 73645977451),
        STRUCT('2026-03-31', 158590750, 10350000000, 105654448953, 205929230, 401720280, 294810936, 89806281610, 2664252398, 68675391820, 13546000000, 73958114267),
        STRUCT('2026-04-30', 166338858, 10375000000, 106045801433, 200758280, 406114895, 274594518, 90138931218, 2831985248, 68929770931, 13585000000, 74232061003),
        STRUCT('2026-05-31', 175489433, 10400000000, 106472620685, 202034969, 418688590, 282762957, 90501727582, 2802420611, 69207203445, 13624000000, 74530834479)
      ])
    ;;
  }

  # --- WYMIARY (DIMENSIONS) ---

  dimension_group: data_biznesowa {
    label: "Data Biznesowa"
    type: time
    timeframes: [raw, date, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_biznesowa ;;
  }

  # --- MIARY (MEASURES) ---

  measure: total_zysk_netto { type: sum hidden: yes sql: ${TABLE}.zysk_netto ;; }
  measure: total_koszty_dzialania { type: sum hidden: yes sql: ${TABLE}.koszty_dzialania ;; }
  measure: total_przychody_operacyjne { type: sum hidden: yes sql: ${TABLE}.przychody_operacyjne ;; }
  measure: total_wynik_odsetek { type: sum hidden: yes sql: ${TABLE}.wynik_z_tytulu_odsetek ;; }

  measure: avg_kapital_wlasny { type: average hidden: yes sql: ${TABLE}.kapital_wlasny ;; }
  measure: avg_aktywa_ogolem { type: average hidden: yes sql: ${TABLE}.aktywa_ogolem ;; }
  measure: avg_aktywa_dochodowe { type: average hidden: yes sql: ${TABLE}.aktywa_dochodowe ;; }
  measure: avg_kredyty_zagrozone { type: average hidden: yes sql: ${TABLE}.kredyty_zagrozone ;; }
  measure: avg_portfel_kredytowy_ogolem { type: average hidden: yes sql: ${TABLE}.portfel_kredytowy_ogolem ;; }
  measure: avg_fundusze_wlasne { type: average hidden: yes sql: ${TABLE}.fundusze_wlasne ;; }
  measure: avg_aktywa_wazone_ryzykiem { type: average hidden: yes sql: ${TABLE}.aktywa_wazone_ryzykiem ;; }

  # ROE
  measure: kpi_roe {
    label: "ROE (Annualized)"
    group_label: "Rentowność"
    type: number
    sql: (12.0 * ${total_zysk_netto}) / NULLIF(${avg_kapital_wlasny}, 0) ;;
    value_format: "0.00%"
  }

  # ROA
  measure: kpi_roa {
    label: "ROA (Annualized)"
    group_label: "Rentowność"
    type: number
    sql: (12.0 * ${total_zysk_netto}) / NULLIF(${avg_aktywa_ogolem}, 0) ;;
    value_format: "0.00%"
  }

  # C/I
  measure: kpi_cost_to_income {
    label: "C/I Ratio"
    group_label: "Efektywność Kosztowa"
    type: number
    sql: ${total_koszty_dzialania} / NULLIF(${total_przychody_operacyjne}, 0) ;;
    value_format: "0.00%"
  }

  # NIM
  measure: kpi_nim {
    label: "NIM (Annualized)"
    group_label: "Rentowność"
    type: number
    sql: (12.0 * ${total_wynik_odsetek}) / NULLIF(${avg_aktywa_dochodowe}, 0) ;;
    value_format: "0.00%"
  }

  # NPL
  measure: kpi_npl {
    label: "NPL Ratio"
    group_label: "Ryzyko i Jakość Portfela"
    type: number
    sql: ${avg_kredyty_zagrozone} / NULLIF(${avg_portfel_kredytowy_ogolem}, 0) ;;
    value_format: "0.00%"
  }

  # TCR / CAR
  measure: kpi_tcr {
    label: "TCR / CAR"
    group_label: "Bezpieczeństwo i Kapitał"
    type: number
    sql: ${avg_fundusze_wlasne} / NULLIF(${avg_aktywa_wazone_ryzykiem}, 0) ;;
    value_format: "0.00%"
  }
}
