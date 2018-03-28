From: blackzert@gmail.com (Ilya Smith)
Date: Wed, 28 Mar 2018 21:47:15 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180327143820.GH5652@dhcp22.suse.cz>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <20180327143820.GH5652@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <F9D157F8-F70F-45BC-B9E4-B5CB7CC419F4@gmail.com>
To: linux-snps-arc@lists.infradead.org


> On 27 Mar 2018,@17:38, Michal Hocko <mhocko@kernel.org> wrote:
> 
> On Tue 27-03-18 16:51:08, Ilya Smith wrote:
>> 
>>> On 27 Mar 2018,@10:24, Michal Hocko <mhocko@kernel.org> wrote:
>>> 
>>> On Mon 26-03-18 22:45:31, Ilya Smith wrote:
>>>> 
>>>>> On 26 Mar 2018,@11:46, Michal Hocko <mhocko@kernel.org> wrote:
>>>>> 
>>>>> On Fri 23-03-18 20:55:49, Ilya Smith wrote:
>>>>>> 
>>>>>>> On 23 Mar 2018,@15:48, Matthew Wilcox <willy@infradead.org> wrote:
>>>>>>> 
>>>>>>> On Thu, Mar 22, 2018@07:36:36PM +0300, Ilya Smith wrote:
>>>>>>>> Current implementation doesn't randomize address returned by mmap.
>>>>>>>> All the entropy ends with choosing mmap_base_addr at the process
>>>>>>>> creation. After that mmap build very predictable layout of address
>>>>>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>>>>>> randomization of address on any mmap call.
>>>>>>> 
>>>>>>> Why should this be done in the kernel rather than libc?  libc is perfectly
>>>>>>> capable of specifying random numbers in the first argument of mmap.
>>>>>> Well, there is following reasons:
>>>>>> 1. It should be done in any libc implementation, what is not possible IMO;
>>>>> 
>>>>> Is this really so helpful?
>>>> 
>>>> Yes, ASLR is one of very important mitigation techniques which are really used 
>>>> to protect applications. If there is no ASLR, it is very easy to exploit 
>>>> vulnerable application and compromise the system. We can?t just fix all the 
>>>> vulnerabilities right now, thats why we have mitigations - techniques which are 
>>>> makes exploitation more hard or impossible in some cases.
>>>> 
>>>> Thats why it is helpful.
>>> 
>>> I am not questioning ASLR in general. I am asking whether we really need
>>> per mmap ASLR in general. I can imagine that some environments want to
>>> pay the additional price and other side effects, but considering this
>>> can be achieved by libc, why to add more code to the kernel?
>> 
>> I believe this is the only one right place for it. Adding these 200+ lines of 
>> code we give this feature for any user - on desktop, on server, on IoT device, 
>> on SCADA, etc. But if only glibc will implement ?user-mode-aslr? IoT and SCADA 
>> devices will never get it.
> 
> I guess it would really help if you could be more specific about the
> class of security issues this would help to mitigate. My first
> understanding was that we we need some randomization between program
> executable segments to reduce the attack space when a single address
> leaks and you know the segments layout (ordering). But why do we need
> _all_ mmaps to be randomized. Because that complicates the
> implementation consirably for different reasons you have mentioned
> earlier.
> 

There are following reasons:
1) To protect layout if one region was leaked (as you said). 
2) To protect against exploitation of Out-of-bounds vulnerabilities in some 
cases (CWE-125 , CWE-787)
3) To protect against exploitation of Buffer Overflows in some cases (CWE-120)
4) To protect application in cases when attacker need to guess the address 
(paper ASLR-NG by  Hector Marco-Gisbert and  Ismael Ripoll-Ripoll)
And may be more cases.

> Do you have any specific CVE that would be mitigated by this
> randomization approach?
> I am sorry, I am not a security expert to see all the cosequences but a
> vague - the more randomization the better - sounds rather weak to me.

It is hard to name concrete CVE number, sorry. Mitigations are made to prevent 
exploitation but not to fix vulnerabilities. It means good mitigation will make 
vulnerable application crash but not been compromised in most cases. This means 
the better randomization, the less successful exploitation rate.


Thanks,
Ilya
