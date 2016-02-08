From: dcb314@hotmail.com (David Binderman)
Date: Mon, 8 Feb 2016 13:37:25 +0000
Subject: linux-4.5-rc3/arch/arc/kernel/unwind.c:629: undefined behaviour ?
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DUB128-W14BBCF3C8444D1C16443DE9CD50@phx.gbl>
To: linux-snps-arc@lists.infradead.org

Hello there,

[linux-4.5-rc3/arch/arc/kernel/unwind.c:629]: (warning) Invalid test for overflow 'ptr+len<ptr'. Condition is always false unless there is overflow, and overflow is Undefined Behaviour.

Source code is

??????? if (ptr + len < ptr || ptr + len> end)
??????????? return -1;

Suggest code rework.


Regards

David Binderman

 		 	   		  
