var vm = new Vue({
  el: '#example',
  data: {
     message: 'Hello'
  },

  // 算出プロパティ、リアクティブな依存関係元（message）が変更されたときのみ、再評価される
  // キャッシュが効く
  computed: {
    reversedMessage: function () {
      return this.message.split('').reverse().join('')
    },
    now: function () {
      return Date.now()
    }
  },

  // メソッド、呼び出すたびに評価される
  methods: {
    reverseMessage: function () {
      return this.message.split('').reverse().join('')
    }
  }
})


// watch を使用した冗長なコード
// var vm2 = new Vue({
//   el: '#demo',
//   data: {
//     firstName: 'Foo',
//     lastName: 'Bar',
//     fullName: 'Foo Bar'
//   },
//   watch: {
//     firstName: function (val) {
//       this.fullName = val + ' ' + this.lastName
//     },
//     lastName: function (val) {
//       this.fullName = this.lastName + ' ' + val
//     }
//   }
// })

// computedを使用したコード
// var vm2 = new Vue({
//   el: '#demo',
//   data: {
//     firstName: 'Foo',
//     lastName: 'Bar'
//   },
//   computed: {
//     fullName: function() {
//       return this.firstName + ' ' + this.lastName
//     }
//   }
// })

// 算出プロパティはデフォルトでgetter関数のみだが、setter関数も使用できる
var vm2 = new Vue({
  el: '#demo',
  data: {
    firstName: 'Foo',
    lastName: 'Bar'
  },
  computed: {
    fullName: {
      get: function () {
        return this.firstName + ' ' + this.lastName
      },
      set: function (newValue) {
        var names = newValue.split(' ')
        this.firstName = names[0]
        this.lastName = names[names.length - 1]
      }
    }
  }
})

var watchExampleVM = new Vue({
  el: '#watch-example',
  data: {
    question: '',
    answer: 'I cannot give you an answer until you ask a question!'
  },
  watch: {
    question: function (newQuestion, oldQuestion) {
      this.answer = 'Waiting for you to stop typing...'
      this.debouncedGetAnswer()
    }
  },
  created: function () {
    this.debouncedGetAnswer = _.debounce(this.getAnswer, 500)
  },
  methods: {
    getAnswer: function () {
      if (this.question.indexOf('?') === -1) {
        this.answer = 'Questions usually contain a question mark. ;-)'
        return
      }
      this.answer = 'Thinking...'
      var vm = this
      axios.get('https://yesno.wtf/api')
        .then(function (response) {
          vm.answer = _.capitalize(response.data.answer)
        })
        .catch(function (error) {
          vm.answer = 'Error! Could not reach the API. ' + error
        })
    }
  }
})
