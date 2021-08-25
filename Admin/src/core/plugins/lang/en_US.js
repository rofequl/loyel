import general from "./en-US/setup/general";
import pages from "@/core/plugins/lang/en-US/setup/pages";
import nav from "@/core/plugins/lang/en-US/nav";
import defaults from "./en-US/default"

export default {
    message: '-',
    ...defaults,
    ...general,
    ...nav,
    ...pages,
}
