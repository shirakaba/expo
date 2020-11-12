import sha1 from 'sha1';

import getInstallationIdAsync from './getInstallationIdAsync';

let _snackId: string | undefined;

export default async function getSnackId(): Promise<string> {
  if (!_snackId) {
    const hash = sha1(await getInstallationIdAsync()).toLowerCase();
    _snackId = `${hash.slice(0, 4)}-${hash.slice(4, 8)}`;
  }
  return _snackId;
}
