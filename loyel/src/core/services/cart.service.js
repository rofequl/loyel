const CART_PRODUCT = "user_cart_product";

export const getCartProduct = () => {
    return JSON.parse(window.localStorage.getItem(CART_PRODUCT));
};

export const saveCartProduct = product => {
    window.localStorage.setItem(CART_PRODUCT, JSON.stringify(product));
};

export const destroyCartProduct = () => {
    window.localStorage.removeItem(CART_PRODUCT);
};

export default {getCartProduct, saveCartProduct, destroyCartProduct};
