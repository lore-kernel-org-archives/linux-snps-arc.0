Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8DC106ACE1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2026 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rvCr4NSd9kD7qUfZlegexaxaosaLOf8jSO851r0eXQ=; b=m5QVA5Em0f/7H2
	HE3bHQNC+nDdg6y50ORDoJKWRh6alnLup9CHwTcZFQqnXix3Qs9Q7Fm7DRGGar4sd2DGmgOXj39ga
	bmBetRelFQ5/1ZM9GyMXKTobKJ92NK7A3S1A4fiNvd2KSJbLUMvMU8jimCOM2jHH/NdAxvx2HFxRp
	AxMqY9HuYeVjMTbDWTKJN5QBnyoPpm2PC9GxlckAHMXoCXoUB/mg2Vq+n+wUa5EELAY87svnFqySp
	GR/AuYqa/0UoLeztBoBEzeqN9L1B2pjHF+En7NxMl4A2x3DQzSS2scJkKv3bHXofQ/CaQ7FaC7AV4
	miHFM6nbQ+bf5AczOS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lXH-0000000F1pJ-17Zq;
	Thu, 12 Mar 2026 19:17:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lX0-0000000F1S3-3sdj;
	Thu, 12 Mar 2026 19:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AB7961335;
	Thu, 12 Mar 2026 19:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C177AC2BCB2;
	Thu, 12 Mar 2026 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343033;
	bh=iWPieZ/e1fDZ4FEmYCmXjevHQbQOBJ40JrJjUOR3wHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KC6FeGCNssf3xoyMY7ZJzUJYUHfK2uC6hSPeHxppmuWFsPgtTu4HWiEFUPQTgW3s0
	 SCaEgSpKNLdqMrPpbg0IFqC8jShBIJNnXSLUXjMdp/js81MJTAluetPJdnqpyJGsiE
	 N0zO8GHB7kkEpsfm5Cyzv5dMpxK/mt8G242VdoXVALclaA+kSz8QPM8A8N3StWhsh3
	 Nt5oxs6IDdvx42B9+6uvJu7PzgTuuqvZ7aZmfZpKuBfrjFIHoH/gK3vuFsQZMPa/Pq
	 Bwzv63qG+IVJaQRp93YRvFwuwSBXlZwsaKgQ7g5mNW+OUwksU7I5yBmOtpazl4ZFdA
	 BFyHw6onS25yQ==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH 16/20] mm/vma: introduce vma_clear_flags[_mask]()
Date: Thu, 12 Mar 2026 19:16:14 +0000
Message-ID: <f8f74622b4ee92e5df2b7546439a1afb3a922cfa.1773342102.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773342102.git.ljs@kernel.org>
References: <cover.1773342102.git.ljs@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Introduce a helper function and helper macro to easily clear a VMA's flags
using the new vma_flags_t vma->flags field:

* vma_clear_flags_mask() - Clears all of the flags in a specified mask in
			   the VMA's flags field.
* vma_clear_flags() - Clears all of the specified individual VMA flag bits
		      in a VMA's flags field.

Also update the VMA tests to reflect the change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h              | 16 ++++++++++++++++
 tools/testing/vma/include/dup.h |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4b574d941ea3..bec1b43efa50 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1324,6 +1324,22 @@ static __always_inline void vma_set_flags_mask(struct vm_area_struct *vma,
 #define vma_set_flags(vma, ...) \
 	vma_set_flags_mask(vma, mk_vma_flags(__VA_ARGS__))
 
+/* Helper to clear all VMA flags in a VMA. */
+static __always_inline void vma_clear_flags_mask(struct vm_area_struct *vma,
+		vma_flags_t flags)
+{
+	vma_flags_clear_mask(&vma->flags, flags);
+}
+
+/*
+ * Helper macro for clearing VMA flags, e.g.:
+ *
+ * vma_clear_flags(vma, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTEXPAND_BIT,
+ * 		VMA_DONTDUMP_BIT);
+ */
+#define vma_clear_flags(vma, ...) \
+	vma_clear_flags_mask(vma, mk_vma_flags(__VA_ARGS__))
+
 /*
  * Test whether a specific VMA flag is set in a VMA descriptor, e.g.:
  *
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 70cabacdb9cc..81bd34c62c75 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1039,6 +1039,15 @@ static __always_inline void vma_set_flags_mask(struct vm_area_struct *vma,
 #define vma_set_flags(vma, ...) \
 	vma_set_flags_mask(vma, mk_vma_flags(__VA_ARGS__))
 
+static __always_inline void vma_clear_flags_mask(struct vm_area_struct *vma,
+		vma_flags_t flags)
+{
+	vma_flags_clear_mask(&vma->flags, flags);
+}
+
+#define vma_clear_flags(vmag, ...) \
+	vma_clear_flags_mask(vmag, mk_vma_flags(__VA_ARGS__))
+
 static __always_inline bool vma_desc_test(const struct vm_area_desc *desc,
 		vma_flag_t bit)
 {
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
