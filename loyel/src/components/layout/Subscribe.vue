<template>
  <div class="footer-feature home-newsletter mt-3">
    <form @submit.prevent="submit" @keydown="form.onKeydown($event)" class="input-group">
      <input type="email" v-model="form.email" class="form-control" placeholder="Enter your email"/>
      <span class="input-group-btn"><button class="btn btn-theme" type="submit">Subscribe</button></span>
    </form>
  </div>
</template>

<script>
export default {
  name: "Subscribe",
  data() {
    return {
      form: new Form({
        email: '',
      }),
    }
  },
  methods: {
    submit() {
      this.form.post('subscribe')
          .then(({data}) => {
            this.$notification['success']({
              message: 'Congratulations',
              description: 'Subscribe successfully.',
              style: {marginTop: '41px'},
              duration: 4
            });
          })
          .catch(err => {
            this.$notification['error']({
              message: 'Warning',
              description: ((err.response || {}).data || {}).email || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
          .finally(() => this.form.reset())
    }
  }
}
</script>

<style scoped>
.home-newsletter .form-control {
  height: 36px;
  background: rgba(255, 255, 255, 0.6);
  border-color: gray;
  border-radius: 15px 0 0 15px;
}

.home-newsletter .form-control:focus {
  box-shadow: none;
  border-color: #243c4f;
}

.home-newsletter .btn {
  min-height: 36px;
  border-radius: 0 15px 15px 0;
  background: #665c5c;
  color: #fff;
}
</style>
