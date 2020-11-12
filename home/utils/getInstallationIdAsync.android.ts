import Application from 'expo-application';

export default async function getInstallationIdAsync() {
  return Application.androidId!;
}
