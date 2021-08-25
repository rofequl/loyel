import Vue from 'vue'
import VueI18n from 'vue-i18n'

// default lang
import enUS from './lang/en_US'
import bnBD from './lang/bn-BD'

Vue.use(VueI18n)

export const defaultLang = 'en_US'

const messages = {
    'en-US': {
        ...enUS
    },
    'bn-BD': {
        ...bnBD
    }
}
export const i18n = new VueI18n({
    silentTranslationWarn: true,
    locale: defaultLang,
    fallbackLocale: defaultLang,
    messages
})
