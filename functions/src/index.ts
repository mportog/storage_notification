import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp(functions.config().firebase);

export const onNewOrder = functions.firestore.document("/assets/PAU5401001/{date}").onCreate(async (snapshot, context) => {

    const date = context.params.date;

    const querySnapshot = await admin.firestore().collection('assets').doc('PAU5401001').collection('date').get();
    const allDates = querySnapshot.docs.map(doc => doc.id);

    console.log(date, allDates);
});