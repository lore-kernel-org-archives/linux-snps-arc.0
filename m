From: blackzert@gmail.com (Ilya Smith)
Date: Fri, 23 Mar 2018 20:55:49 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180323124806.GA5624@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
To: linux-snps-arc@lists.infradead.org


> On 23 Mar 2018,@15:48, Matthew Wilcox <willy@infradead.org> wrote:
> 
> On Thu, Mar 22, 2018@07:36:36PM +0300, Ilya Smith wrote:
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases. This patch make
>> randomization of address on any mmap call.
> 
> Why should this be done in the kernel rather than libc?  libc is perfectly
> capable of specifying random numbers in the first argument of mmap.
Well, there is following reasons:
1. It should be done in any libc implementation, what is not possible IMO;
2. User mode is not that layer which should be responsible for choosing
random address or handling entropy;
3. Memory fragmentation is unpredictable in this case

Off course user mode could use random ?hint? address, but kernel may
discard this address if it is occupied for example and allocate just before
closest vma. So this solution doesn?t give that much security like 
randomization address inside kernel.
