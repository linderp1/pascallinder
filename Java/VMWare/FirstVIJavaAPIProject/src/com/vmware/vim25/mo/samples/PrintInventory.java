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
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.vmware.vim25.mo.*;
import com.vmware.vim25.mo.Folder;

/**
 * Sample code to show how to use the Managed Object APIs.
 * @author Steve JIN (sjin@vmware.com)
 */

public class PrintInventory 
{
	public static void main(String[] args) throws Exception
	{

		ServiceInstance si = new ServiceInstance(new URL("https://145.245.30.16/sdk"), "root", "Bian1408", true);
		Folder rootFolder = si.getRootFolder();
		
		System.out.println("============ Data Centers ============");
		ManagedEntity[] dcs = new InventoryNavigator(rootFolder).searchManagedEntities(
				new String[][] { {"Datacenter", "name" }, }, true);
		for(int i=0; i<dcs.length; i++)
		{
			System.out.println("Datacenter["+i+"]=" + dcs[i].getName());
		}
		
		System.out.println("\n============ Virtual Machines ============");
		ManagedEntity[] vms = new InventoryNavigator(rootFolder).searchManagedEntities(
				new String[][] { {"VirtualMachine", "name" }, }, true);
		for(int i=0; i<vms.length; i++)
		{
			System.out.println("vm["+i+"]=" + vms[i].getName());
		}

		System.out.println("\n============ Hosts ============");
		ManagedEntity[] hosts = new InventoryNavigator(rootFolder).searchManagedEntities(
				new String[][] { {"HostSystem", "name" }, }, true);
		for(int i=0; i<hosts.length; i++)
		{
			System.out.println("host["+i+"]=" + hosts[i].getName());
		}
		
		si.getServerConnection().logout();
		
		 

 
		Properties props = new Properties(); 
		props.put("mail.smtp.host", "mailhost.roche.com"); 
		Session s = Session.getInstance(props,null); 


		InternetAddress from = new InternetAddress("pascal.linder@roche.com");
		InternetAddress to   = new InternetAddress("pascal.linder@roche.com");
		

		MimeMessage message = new MimeMessage(s); 
		message.setFrom(from); 
		message.addRecipient(Message.RecipientType.TO, to); 

		message.setSubject("RBAMSBALI04 ESXi 5.0 Server Inventory"); 
		message.setText("Your text"); 
		Transport.send(message); 

		
	}

}
