import general from "./bn-BD/setup/general";
import pages from "@/core/plugins/lang/bn-BD/setup/pages";
import nav from "@/core/plugins/lang/bn-BD/nav";
import defaults from "./bn-BD/default"

export default {
    message: '-',
    ...defaults,
    ...general,
    ...nav,
    ...pages,
}
