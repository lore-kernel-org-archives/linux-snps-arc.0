From: willy@infradead.org (Matthew Wilcox)
Date: Fri, 9 Aug 2019 03:16:33 -0700
Subject: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
In-Reply-To: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190809101632.GM5482@bombadil.infradead.org>
To: linux-snps-arc@lists.infradead.org

On Fri, Aug 09, 2019@01:03:17PM +0530, Anshuman Khandual wrote:
> Should alloc_gigantic_page() be made available as an interface for general
> use in the kernel. The test module here uses very similar implementation from
> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
> needs to be exported through a header.

Why are you allocating memory at all instead of just using some
known-to-exist PFNs like I suggested?
