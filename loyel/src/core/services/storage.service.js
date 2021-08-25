export const get = (key, value = null) => {
    let data = window.localStorage.getItem(key);
    return data ? data : value;
};

export const set = (key, value) => {
    window.localStorage.setItem(key, value);
};

export const destroy = (key) => {
    window.localStorage.removeItem(key);
};

export default {get, set, destroy};
