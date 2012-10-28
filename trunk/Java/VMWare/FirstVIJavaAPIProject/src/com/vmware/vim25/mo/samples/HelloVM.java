/*================================================================================
Copyright (c) 2008 VMware, Inc. All Rights Reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, 
this list of conditions and the following disclaimer.

 * Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

 * Neither the name of VMware, Inc. nor the names of its contributors may be used
to endorse or promote products derived from this software without specific prior 
written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL VMWARE, INC. OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.
================================================================================*/
//http://vijava.svn.sourceforge.net/viewvc/vijava/trunk/src/com/vmware/vim25/mo/samples/

package com.vmware.vim25.mo.samples;

import java.net.URL;
import com.vmware.vim25.*;
import com.vmware.vim25.mo.*;

public class HelloVM 
{
	public static void main(String[] args) throws Exception
	{
		long start = System.currentTimeMillis();
		ServiceInstance si = new ServiceInstance(new URL("https://145.245.30.16/sdk"), "root", "Bian1408", true);
		long end = System.currentTimeMillis();

		System.out.println(si.getAboutInfo().fullName);
		System.out.println("Login time (in ms):" + (end-start));
		//System.out.println(si.getAboutInfo().apiType);

		Folder rootFolder = si.getRootFolder();
		String name = rootFolder.getName();
		System.out.println("root folder:" + name);
		ManagedEntity[] mes = new InventoryNavigator(rootFolder).searchManagedEntities("VirtualMachine");
		if(mes==null || mes.length ==0)
		{
			return;
		}
		else {
			for ( int i=0; i<mes.length; i++ ) {
				VirtualMachine vm = (VirtualMachine) mes[i];

				VirtualMachineConfigInfo vminfo = vm.getConfig();
				VirtualMachineCapability vmc = vm.getCapability();

				vm.getResourcePool();
				System.out.println(i+1 + " " + vm.getName());
				System.out.println("  GuestOS: " + vminfo.getGuestFullName());
				System.out.println("  Change Tracking enabled: " + vminfo.getChangeTrackingEnabled());
				System.out.println("  Memory limit: " + vminfo.getHotPlugMemoryLimit());
				System.out.println("  Multiple snapshot supported: " + vmc.isMultipleSnapshotsSupported());
				
			}
		}
		//VirtualMachine vm = (VirtualMachine) mes[0]; 



		si.getServerConnection().logout();
	}

}
