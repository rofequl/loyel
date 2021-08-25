<template>
  <a-upload :file-list="splitDate" class="upload-list-inline" list-type="picture"
            :remove="handleRemove" :before-upload="beforeUpload">
    <a-button>
      <a-icon type="upload"/>
      {{$t('uploadImageClick')}}
    </a-button>
  </a-upload>
</template>

<script>
export default {
  props: ['value'],
  name: "ImageUpload",
  data() {
    return {
      fileList: []
    }
  },
  computed: {
    // eslint-disable-next-line vue/return-in-computed-property
    splitDate() {
      const splitValueString = this.value;
      if (splitValueString) {
        return [{
          uid: '-1',
          name: this.$t('uploadImage'),
          status: 'done',
          thumbUrl: this.value,
        }]
      }
    }
  },
  methods: {
    handleRemove() {
      this.$emit('input', '')
    },
    beforeUpload(file) {
      let name = file.name + ' is not an image..';
      if (!file.type.match('image.*')) {
        this.$notification['error']({
          message: 'Warning',
          description: name,
          style: {
            marginTop: '41px'
          },
          duration: 5
        })
        return false;
      }
      let names = file.name;
      let extension = names.substring(names.lastIndexOf("."), names.length).toLowerCase();
      if ((extension !== '.png') && (extension !== '.jpg') && (extension !== '.jpeg')) {
        this.$notification['error']({
          message: 'Warning',
          description: 'This type image are not support',
          style: {
            marginTop: '41px'
          },
          duration: 5
        })
        return false;
      }

      if (file['size'] > 2111775) {
        this.$notification['error']({
          message: 'Oops...!',
          description: 'You are uploading a large file.',
          style: {
            marginTop: '41px'
          },
          duration: 5
        })
        return false;
      }
      let reader = new FileReader();
      reader.onload = () => this.$emit('input', reader.result);
      reader.readAsDataURL(file);
      return false;
    }
  },
}
</script>

<style scoped>

</style>
