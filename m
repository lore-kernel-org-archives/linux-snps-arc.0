From: blackzert@gmail.com (Ilya Smith)
Date: Mon, 26 Mar 2018 22:45:31 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180326084650.GC5652@dhcp22.suse.cz>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
To: linux-snps-arc@lists.infradead.org


> On 26 Mar 2018,@11:46, Michal Hocko <mhocko@kernel.org> wrote:
> 
> On Fri 23-03-18 20:55:49, Ilya Smith wrote:
>> 
>>> On 23 Mar 2018,@15:48, Matthew Wilcox <willy@infradead.org> wrote:
>>> 
>>> On Thu, Mar 22, 2018@07:36:36PM +0300, Ilya Smith wrote:
>>>> Current implementation doesn't randomize address returned by mmap.
>>>> All the entropy ends with choosing mmap_base_addr at the process
>>>> creation. After that mmap build very predictable layout of address
>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>> randomization of address on any mmap call.
>>> 
>>> Why should this be done in the kernel rather than libc?  libc is perfectly
>>> capable of specifying random numbers in the first argument of mmap.
>> Well, there is following reasons:
>> 1. It should be done in any libc implementation, what is not possible IMO;
> 
> Is this really so helpful?

Yes, ASLR is one of very important mitigation techniques which are really used 
to protect applications. If there is no ASLR, it is very easy to exploit 
vulnerable application and compromise the system. We can?t just fix all the 
vulnerabilities right now, thats why we have mitigations - techniques which are 
makes exploitation more hard or impossible in some cases.

Thats why it is helpful.

> 
>> 2. User mode is not that layer which should be responsible for choosing
>> random address or handling entropy;
> 
> Why?

Because of the following reasons:
1. To get random address you should have entropy. These entropy shouldn?t be 
exposed to attacker anyhow, the best case is to get it from kernel. So this is
a syscall.
2. You should have memory map of your process to prevent remapping or big
fragmentation. Kernel already has this map. You will got another one in libc.
And any non-libc user of mmap (via syscall, etc) will make hole in your map.
This one also decrease performance cause you any way call syscall_mmap 
which will try to find some address for you in worst case, but after you already
did some computing on it.
3. The more memory you use in userland for these proposal, the easier for
attacker to leak it or use in exploitation techniques.
4. It is so easy to fix Kernel function and so hard to support memory
management from userspace.

> 
>> 3. Memory fragmentation is unpredictable in this case
>> 
>> Off course user mode could use random ?hint? address, but kernel may
>> discard this address if it is occupied for example and allocate just before
>> closest vma. So this solution doesn?t give that much security like 
>> randomization address inside kernel.
> 
> The userspace can use the new MAP_FIXED_NOREPLACE to probe for the
> address range atomically and chose a different range on failure.
> 

This algorithm should track current memory. If he doesn?t he may cause
infinite loop while trying to choose memory. And each iteration increase time
needed on allocation new memory, what is not preferred by any libc library
developer.

Thats why I did this patch.

Thanks,
Ilya
