From: dalias@libc.org (Rich Felker)
Date: Fri, 23 Mar 2018 14:00:24 -0400
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180323124806.GA5624@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180323180024.GB1436@brightrain.aerifal.cx>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 23, 2018@05:48:06AM -0700, Matthew Wilcox wrote:
> On Thu, Mar 22, 2018@07:36:36PM +0300, Ilya Smith wrote:
> > Current implementation doesn't randomize address returned by mmap.
> > All the entropy ends with choosing mmap_base_addr at the process
> > creation. After that mmap build very predictable layout of address
> > space. It allows to bypass ASLR in many cases. This patch make
> > randomization of address on any mmap call.
> 
> Why should this be done in the kernel rather than libc?  libc is perfectly
> capable of specifying random numbers in the first argument of mmap.

Generally libc does not have a view of the current vm maps, and thus
in passing "random numbers", they would have to be uniform across the
whole vm space and thus non-uniform once the kernel rounds up to avoid
existing mappings. Also this would impose requirements that libc be
aware of the kernel's use of the virtual address space and what's
available to userspace -- for example, on 32-bit archs whether 2GB,
3GB, or full 4GB (for 32-bit-user-on-64-bit-kernel) is available, and
on 64-bit archs where fewer than the full 64 bits are actually valid
in addresses, what the actual usable pointer size is. There is
currently no clean way of conveying this information to userspace.

Rich
