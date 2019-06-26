<template>
  <div>
    <div class="card">
      <div class="card-title">
        <h1>Hello</h1>
        <h4>My name is</h4>
      </div>
      <div class="card-body">
        <h2>{{ firstName }} {{ lastName }}</h2>
        <strong>I have {{ skillsTotal }} skills</strong>
        <div v-if="hireMe" class="hireable">I am available for hire!</div>
        <div v-else class="hireable">I work in blockchain!</div>
      </div>
    </div>

    <div class="card form">
      <div class="card-input">
        <label>First Name</label>
        <input type="text" v-model="tmpFirstName">
        <button @click.prevent="setFirstname">Update</button>
      </div>
      <div class="card-input">
        <label>Last Name</label>
        <input type="text" v-model="lastName">
        <button @click.prevent="setLastname">Update</button>
      </div>
      <div class="card-input">
        <label>Increment Skills</label>
        <button @click.prevent="incrementSkills">Update</button>
      </div>
      <div class="card-input">
        <input type="checkbox" v-model="hireMe" @change="toggleHireStatus">
        <label>I want to be hired!</label>
      </div>
    </div>
  </div>
</template>

<script>
// import EmbarkJS from 'Embark/EmbarkJS'
// import Portfolio from '../../../build/contracts/Portfolio'

export default {
  name: 'HelloCard',

  data() {
    return {
      hireMe: false,
      skillsTotal: 0,
      firstName: '-',
      tmpFirstName: '',
      lastName: '',
    };
  },

  // methods: {
  //   async setFirstname() {
  //     // NOTE: Send is used, since we are updating the stored state,
  //     which requires a transaction fee
  //     await Portfolio.methods.updateFirstname(this.tmpFirstName).send();
  //     Portfolio.methods.getFullname().call().then(res => {
  //       this.firstName = res._firstName
  //     });
  //   },
  //   setLastname() {
  //     // NOTE: Another way of doing the same as First,
  //     however we just commit data to UI immediately instead of wait for blockchain.
  //     Portfolio.methods.updateLastname(this.lastName).send();
  //   },
  //   async incrementSkills() {
  //     // NOTE: This shows all the logic living within the contract,
  //     UI must update based on contract data!
  //     await Portfolio.methods.incrementSkills().send();
  //     // NOTE: Since im lazy, we just re-get all contract state :)
  //     this.getAllValues()
  //   },
  //   toggleHireStatus() {
  //     // NOTE: A basic data update
  //     Portfolio.methods.updateHireStatus(this.hireMe).send();
  //   },
  //   getAllValues() {
  //     Portfolio.methods.getFullname().call().then(res => {
  //       // NOTE: This is an example of a Tuple returned data set
  //       this.firstName = res._firstName
  //       this.lastName = res._lastName
  //     });
  //     Portfolio.methods.skillsTotal().call().then(res => {
  //       this.skillsTotal = res
  //     });
  //     Portfolio.methods.hireMe().call().then(res => {
  //       this.hireMe = res
  //     });
  //   }
  // },

  // Load contrct data
  mounted() {
    console.log('connecting...');
    // EmbarkJS.onReady(err => {
    //   if (err) console.log('err', err)
    //   console.log('Connected!')
    //   // NOTE: We're connected, lets get the contract current state
    //   this.getAllValues()
    // })
  },
};
</script>

<style scoped>
.card {
  background: white;
  border-bottom: 5px solid #c94736;
  border-radius: 5px;
  box-shadow: 0 1px 10px -3px rgba(0,0,0,.15);
  margin: 0 auto 60px;
  min-width: 320px;
  max-width: 500px;
  width: 50vw;
}
.card-title {
  background: #c94736;
  border-radius: 5px 5px 0 0;
  color: white;
  padding: 10px 0;
}
.card-title h1 {
  font-size: 45pt;
  font-weight: 500;
  line-height: 45pt;
  letter-spacing: .2em;
  text-transform: uppercase;
  margin: 10px 0;
}
.card-title h4 {
  font-size: 16pt;
  line-height: 12pt;
  letter-spacing: .05em;
  text-transform: lowercase;
  margin: 0;
}

.card-body {
  padding: 20px;
}
.card-body h2 {
  margin: 10px 0;
}

.card.form {
  border-bottom: 0;
  padding: 30px 0;
}

.card-input {
  margin: 0 0 10px;
}
</style>
