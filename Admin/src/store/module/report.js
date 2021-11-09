import ApiService from "@/core/services/api.service";


export default {
    state: {
        stock_report: [],
        most_viewed: [],
        sales_report: [],
    },

    getters: {
        stockReportList: state => state.stock_report,
        stockReportIndex: state => sku => state.stock_report.findIndex(value => value.sku === sku) + 1,
        mostViewedList: state => state.most_viewed,
        mostViewedIndex: state => sku => state.most_viewed.findIndex(value => value.sku === sku) + 1,
        salesReportList: state => state.sales_report,
        salesReportIndex: state => sku => state.sales_report.findIndex(value => value.sku === sku) + 1,
    },

    actions: {
        STOCK_REPORT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("stock-report")
                    .then(({data}) => {
                        commit('SET_STOCK_REPORT_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        MOST_VIEWED_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("most-viewed-product")
                    .then(({data}) => {
                        commit('SET_MOST_VIEWED_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SALES_REPORT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("sales-report")
                    .then(({data}) => {
                        commit('SET_SALES_REPORT_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_STOCK_REPORT_LIST: (state, data) => {
            state.stock_report = data;
        },
        SET_MOST_VIEWED_LIST: (state, data) => {
            state.most_viewed = data;
        },
        SET_SALES_REPORT_LIST: (state, data) => {
            state.sales_report = data;
        },
    }

}
