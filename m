From: dcb314@hotmail.com (David Binderman)
Date: Fri, 20 May 2016 08:17:18 +0000
Subject: linux-4.5-rc3/arch/arc/kernel/unwind.c:629: undefined behaviour ?
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4EAC475@us01wembx1.internal.synopsys.com>
References: <DUB128-W14BBCF3C8444D1C16443DE9CD50@phx.gbl>,
 <C2D7FE5348E1B147BCA15975FBA23075F4EAC475@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DUB128-W2900E1545A955D36D108759C4B0@phx.gbl>
To: linux-snps-arc@lists.infradead.org

Hello there,

----------------------------------------
> What compiler are you using - for me it builds clean here !

A static C/C++ code analyser called cppcheck. Available from sourceforge.
I find it very useful for all C/C++ development.

Regards

David Binderman

>
> -Vineet
>
> On Monday 08 February 2016 07:07 PM, David Binderman wrote:
>> Hello there,
>>
>> [linux-4.5-rc3/arch/arc/kernel/unwind.c:629]: (warning) Invalid test for overflow 'ptr+len<ptr'. Condition is always false unless there is overflow, and overflow is Undefined Behaviour.
>>
>> Source code is
>>
>> if (ptr + len < ptr || ptr + len> end)
>> return -1;
>>
>> Suggest code rework.
>>
>>
>> Regards
>>
>> David Binderman
>>
>>
>
 		 	   		  
