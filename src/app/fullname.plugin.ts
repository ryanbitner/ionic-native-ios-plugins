import { registerPlugin } from '@capacitor/core';
export interface FullNamePluginInterface {
    getFullName(request: {
        firstName: string,
        lastName: string
    }): Promise<{value: string}>;

    presentHelloWorld(value: {fullName: string}): Promise<{value: string}>;
}
const FullNamePlugin = registerPlugin<FullNamePluginInterface>('FullNamePlugin');
export default FullNamePlugin;







