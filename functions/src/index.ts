import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

admin.initializeApp(functions.config().firebase);

export const helloWorld = functions.https.onCall((data, context) =>
    ({ data: "Olá mundo das funções na nuvem" }));


export const getUserData = functions.https.onCall(async (data, context) => {
    if (!context.auth) {
        return {
            "data": "Nenhum usuario logado"
        };
    }
    const snapshot = await admin.firestore().collection("users").doc(context.auth.uid).get();
    return { "data": snapshot.data() };
});

export const addMessage = functions.https.onCall((data, context) => {
    console.log(data);
    return { "success": "true" };
});