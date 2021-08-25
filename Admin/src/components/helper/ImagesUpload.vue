<template>
  <div>
    <a-upload :file-list="splitDate" list-type="picture-card" @preview="handlePreview"
              :remove="handleRemove" :before-upload="beforeUpload">
      <div v-if="splitDate.length < this.max && multiple">
        <a-icon type="plus"/>
        <div class="ant-upload-text">
          {{ title ? title : 'Upload' }}
        </div>
      </div>
      <div v-if="splitDate.length < 1 && !multiple">
        <a-icon type="plus"/>
        <div class="ant-upload-text">
          {{ title ? title : 'Upload' }}
        </div>
      </div>
    </a-upload>
    <a-modal :zIndex="1030" :centered="true" :visible="previewVisible" :footer="null" @cancel="handleCancel">
      <img alt="example" style="width: 100%" :src="previewImage"/>
    </a-modal>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: [String, Array],
      required: true
    },
    title: [String],
    multiple: {
      type: Boolean,
      default: true
    },
    max: {
      type: Number,
      default: 8
    },
  },
  name: "ImagesUpload",
  data() {
    return {
      previewVisible: false,
      previewImage: '',
      fileList: []
    }
  },
  computed: {
    // eslint-disable-next-line vue/return-in-computed-property
    splitDate() {
      const splitValueString = this.value;
      if (this.multiple) {
        let data = [];
        for (let prop in splitValueString) {
          let count = this.fileList.length + Math.floor(Math.random() * 9999);
          data.push({
            uid: count,
            name: this.$t('uploadImage'),
            status: 'done',
            thumbUrl: this.value[prop],
          })
        }
        return data;
      } else {
        if (splitValueString) {
          return [{
            uid: '-1',
            name: this.$t('uploadImage'),
            status: 'done',
            thumbUrl: this.value,
          }]
        } else return [];
      }
    }
  }
  ,
  methods: {
    handleCancel() {
      this.previewVisible = false;
    }
    ,
    handlePreview(file) {
      this.previewImage = file.thumbUrl;
      this.previewVisible = true;
    }
    ,
    handleRemove(data) {
      if (this.multiple) {
        let image = this.splitDate;
        let index = image.findIndex(value => value.uid === data.uid);
        image.splice(index, 1);
        this.$emit('input', image.map(value => value.thumbUrl));
      } else {
        this.$emit('input', '')
      }
    }
    ,
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
      reader.onload = () => {
        if (this.multiple) {
          let image = this.splitDate.map(value => value.thumbUrl);
          image.push(reader.result)
          this.$emit('input', image);
        } else {
          this.$emit('input', reader.result);
        }
      };
      reader.readAsDataURL(file);
      return false;
    }
  }
  ,
}
</script>

<style scoped>

</style>
