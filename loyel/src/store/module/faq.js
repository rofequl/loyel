import ApiService from "@/core/services/api.service";

export default {
    state: {
        question_category: [],
        question_subcategory: [],
        question: [],
    },

    getters: {
        questionCategoryList: state => state.question_category,
        questionCategoryBySlug: state => slug => state.question_category.find(value => value.slug === slug),
        questionCategoryById: state => id => state.question_category.find(value => value.id === id),

        questionSubcategoryBySlug: state => slug => state.question_subcategory.find(value => value.slug === slug),
        questionSubcategoryById: state => id => state.question_subcategory.filter(value => value.category_id === id),
        questionSubcategoryId: state => id => state.question_subcategory.find(value => value.id === id),

        questionBySlug: state => slug => state.question.find(value => value.slug === slug),
        questionBySubcategoryId: state => id => state.question.filter(value => value.subcategory_id === id),
        topQuestionList: state => state.question.filter(value => value.status === 1),
        questionByCategoryId: state => id => state.question.filter(value => value.category_id === id),
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
    },
    mutations: {
        SET_FAQ_LIST: (state, data) => {
            state.question_category = data.category;
            state.question_subcategory = data.subcategory;
            state.question = data.question;
        },
    }

}
