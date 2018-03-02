using System;
using System.Reflection;

public class B {
	public static void Main () {
		var n = Assembly.LoadFrom ("v2/Support.dll");
		var t0 = n.GetType ("Support");
		Activator.CreateInstance (t0);
		var c = Assembly.LoadFrom ("MyMod.dll");
		var t = c.GetType ("MyMod");
		Activator.CreateInstance (t);
	}
}
