import ApiService from "@/core/services/api.service";

export default {
    state: {
        question_category: [],
        question_subcategory: [],
        question: [],
    },

    getters: {
        questionCategoryList: state => state.question_category,
        questionCategoryIndex: state => id => state.question_category.findIndex(value => value.id === id) + 1,
        questionSubcategoryList: state => state.question_subcategory,
        questionSubcategoryIndex: state => id => state.question_subcategory.findIndex(value => value.id === id) + 1,
        questionSubcategoryById: state => id => state.question_subcategory.filter(value => value.category_id === id),
        questionList: state => state.question,
        questionIndex: state => id => state.question.findIndex(value => value.id === id) + 1,
    },

    actions: {
        FAQ_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("question")
                    .then(({data}) => {
                        commit('SET_FAQ_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        TOP_QUESTION({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_QUESTION_TOP', data);
                ApiService.post("top-question", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_FAQ_LIST: (state, data) => {
            state.question_category = data.category;
            state.question_subcategory = data.subcategory;
            state.question = data.question;
        },
        QUESTION_CATEGORY_MODIFY: (state, data) => {
            Object.assign(state.question_category.find(element => element.id === data.id), data);
        },
        QUESTION_CATEGORY_ADD: (state, data) => {
            state.question_category.unshift(data);
        },
        QUESTION_CATEGORY_REMOVE: (state, data) => {
            let index = state.question_category.findIndex(value => value.id === data);
            state.question_category.splice(index, 1);
        },
        QUESTION_SUBCATEGORY_MODIFY: (state, data) => {
            Object.assign(state.question_subcategory.find(element => element.id === data.id), data);
        },
        QUESTION_SUBCATEGORY_ADD: (state, data) => {
            state.question_subcategory.unshift(data);
        },
        QUESTION_SUBCATEGORY_REMOVE: (state, data) => {
            let index = state.question_subcategory.findIndex(value => value.id === data);
            state.question_subcategory.splice(index, 1);
        },
        QUESTION_MODIFY: (state, data) => {
            Object.assign(state.question.find(element => element.id === data.id), data);
        },
        QUESTION_ADD: (state, data) => {
            state.question.unshift(data);
        },
        QUESTION_REMOVE: (state, data) => {
            let index = state.question.findIndex(value => value.id === data);
            state.question.splice(index, 1);
        },
        SET_QUESTION_TOP: (state, data) => {
            state.question.find(element => element.id === data.id).status = data.active;
        },
    }

}
