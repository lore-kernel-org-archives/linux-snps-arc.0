From: willy@infradead.org (Matthew Wilcox)
Date: Fri, 23 Mar 2018 05:48:06 -0700
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180323124806.GA5624@bombadil.infradead.org>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 22, 2018@07:36:36PM +0300, Ilya Smith wrote:
> Current implementation doesn't randomize address returned by mmap.
> All the entropy ends with choosing mmap_base_addr at the process
> creation. After that mmap build very predictable layout of address
> space. It allows to bypass ASLR in many cases. This patch make
> randomization of address on any mmap call.

Why should this be done in the kernel rather than libc?  libc is perfectly
capable of specifying random numbers in the first argument of mmap.
