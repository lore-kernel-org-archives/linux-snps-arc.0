Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2D7CFC267
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2024 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKgPwAOPMkfldXnp1cdmZ4Em7L8/YoE4zCbDnmGBfA8=; b=RzXeZnZmmCesR3
	482zkjPe8Zydpqm4PWMEKnmVaiVgOlFVT3GvKWoKKFk20HHwJptmy3FvXAqj6USOBPFQH7zYpNMGD
	b8iHjpXyLRwwzBZFmXmpS+0J+7wAKEOQdOZ9l/naknoB8Iwp2+iVLo141Ot2SxSHtpqCtyuVrasLd
	P0x7DJHfC9viAjMcytQ8hkpWPQb3e3rTLfdenKZKX75yVbU9FygiXIGLVntoOLaBcnIICF8N5VA0A
	ofLSAAHwgmLusCmiiE52c7NrgOdzsQxbyi66z6AC7gcp7OV9bXSl9vWq46X8c0K6FmlYHXJmL0YJC
	JbO8eaZ3auvY5eE0JD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aZh-000000079Q1-1C7O;
	Tue, 15 Oct 2024 05:58:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aZd-000000079Ny-1QHo;
	Tue, 15 Oct 2024 05:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24023A401EC;
	Tue, 15 Oct 2024 05:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325E1C4CEC7;
	Tue, 15 Oct 2024 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971903;
	bh=Bo5YA9yZSBe+D0lpdePuveWlpCV5YIVCk7/YdaIdQ1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG5sGGJ/uyj72sfIjEOgM3YbtVaq12kKOCpq+pn5nPbrPsQT2kC9ydtk/YzTUly5r
	 4eVw7lpNOy5kN1mWcmFmO7tb0cYSymlnAwpq2Wio7c3ZyfvyaEwu9JPC9amMYfUYbj
	 MtCJD0izwYdWw2k3enQm6TEHcbCSImNPeik7wVIFjejDi/qTBQORJWwxVSIAEvqN5Q
	 l9yRtb72GuYxy6JDeT8CrEewKpTCwuiujl9ZpZL5V+ZbK8ZPy8dUW/6qHkWufpsPdi
	 7qTmnW97lTs/3celEWZrNKMwS30XeMtKFXPBKIkve6XIFrcQu+bxXeiRq9P0LbGJXD
	 wA3RYW8I7S+NQ==
Date: Tue, 15 Oct 2024 08:54:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw4DlTTbz4QwhOvU@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_225825_601449_673DA011 
X-CRM114-Status: GOOD (  10.96  )
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

On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> Mike, please run this with kmemleak enabled and running, and also try to get
> tools/testing/selftests/kmod/kmod.sh to pass.

There was an issue with kmemleak, I fixed it here:

https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4

> I run into silly boot issues with just a guest.

Was it kmemleak or something else?
 
>   Luis

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
