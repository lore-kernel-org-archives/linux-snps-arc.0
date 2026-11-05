Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4157606D812
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2026 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PSkrxzQH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ght8HFf+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VjA4i9eKshDAYxoV92garGyTbGDPG7ogJsffE4HGy6Y=; b=PSkrxzQHDUrptSsreW8fXwpnv1
	J0ujdK4lwSgtP9Kef++IXMTBGkRK0dmj5oAuCe9JL1w2D07bqNj+V2oPA7vgOFJOKG0yS9VXBPkeG
	rOVr4ngtWfbt9rVztBLKYODPRNZ/HL8wcdJtZzdoEXHEMcKlAtnzQl9j6fo49fzujNczZX35BsFbv
	W70B6qFHdzRrWF/iD23fH4qqS8d2xokHS7lfQxnWGsuPCxX2z9xuzjtGwLKIMhNORd/XXCVhUVkwc
	ZD2SomDMpjhGQAkNVY3kORYg1btwgNpPyNewVwJyeTIyVrPXOf1HczcM+Gy4LFq7qwd0sFF7mAQ+E
	133dmRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnfJ-00000007dxN-1SSK;
	Thu, 05 Nov 2026 02:57:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnfI-00000007dx9-1Hjz
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Nov 2026 02:57:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABAD0431E2;
	Thu,  5 Nov 2026 02:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AEC1F00A16;
	Thu,  5 Nov 2026 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793847443;
	bh=yi5pnfb5AXE+YjDZddXWKzl9WSyDPIx6cK+vPTAPQ50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ght8HFf+vpPTxaO/GvNStRwQJNNYnccd84qhTyXWGJiUSFkBEERF8RST3pAGebzSt
	 Rp4j10CTKlvkTPHydzZcKSyOwmDXJkuMWW9eY69EdTUfpf/i235A9jcQ3fzIT5Uf8w
	 R1SAKZvvIdLMBHiGoVGLVBze5O2j0FLj3phaYND4HEAKogqlGkTW1xJQIP9D/OrgH5
	 XnYAYts3vstbs4lSQZ8vW7JEdj/m/zVB4D3MhCLtrkklFeFiHa5FC023flq3jYYYIY
	 krn8du0DML9Sk8cnxQFl0N+SYr7HX3ZiyH0Hqrk2Wm/Uvwz4+493HSyfgGkeoP0FaB
	 dN73d83ax0MWQ==
Message-ID: <41b9058f-ce78-425a-a6ef-cba02bda76d3@kernel.org>
Date: Wed, 4 Nov 2026 18:57:22 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARC: io: use asm-generic MMIO accessors
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261104043535.2039948-1-vgupta@kernel.org>
 <20261104043535.2039948-3-vgupta@kernel.org>
 <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 23:40, Arnd Bergmann wrote:
> On Wed, Nov 4, 2026, at 05:35, Vineet Gupta wrote:
>> ARC MMIO accessors use inline asm, which isn't really needed. It was
>> introduced with the original port back in 2013.
>>
>> As the previous patch showed, inline asm can be error-prone. Letting the
>> compiler emit the accesses also allows 16-bit encodings, scaled-index
>> loads and folding constant offsets (s9) into the access.
>>
>> Without the asm, ARC's __raw_{read,write}{b,w,l}(), *_relaxed(),
>> {read,write}{b,w,l}() and io{read,write}{16,32}be() are the same as the
>> asm-generic/io.h versions, so drop them and use the generic ones.
> Hi Vineet,
>
> In my experience, the generic helpers are also fragile, they just lead
> to different problems when the compiler optimizes them in ways it
> should not.
>
> I would recommend keeping the __raw helpers with the workaround from
> the first patch, possibly both variants depending on the compiler
> version.

OK.

> Using the generic higher level interfaces is a very welcome change
> though, I hope we can eventually get to the point where every
> architecture just needs to provide the __raw_*() ones.

Yes that would be ideal but what we have today is not bad either. I was 
trying to see if its possible to remove boilerplate.

>> Two things stay ARC-specific:
>>
>> - The barriers, now hooked into the generic accessors through
>>    __io_ar()/__io_bw(). On ARCv2 they remain dmb (rmb()/wmb()).
>>    On ARCompact they were empty, relying on the asm "memory" clobber
>>    as a compiler barrier, so make them barrier() explicitly.
>>    The generic defaults would be mb(), i.e. the heavyweight SYNC.
>>    The *_relaxed() accessors only need ordering against other MMIO
>>    accesses, which volatile guarantees.
> Sounds good.
>
>> - The {read,write}s{b,w,l}() string helpers, which, unlike the generic
>>    ones, cope with an unaligned memory buffer. They are defined before
>>    asm-generic/io.h is included, as it calls them (e.g. ioread8_rep()),
>>    so they do the volatile access directly rather than via __raw_*().
> I don't think we want a custom version here. Do you know the reason this
> tries to handle unaligned buffers? If there are drivers that require it,
> we can change the generic implementation to be more like the arc version,
> otherwise this likely just causes larger object code for all users that
> don't ever need unaligned access.

Not specifically but one of my old notes mentions a driver calling 
readsl as follows:

static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
       u8 *bytes, int nbytes)
{
   readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
   if (nbytes & 3) {
    u32 tmp;

    readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
    memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
   }
}


And with readsl at the time being as following was broken due to the 
recast to int.

static inline void readsl(const volatile void __iomem *addr, void *buffer,
			  unsigned int count)
{
	if (count) {
		u32 *buf = buffer;

		do {
			u32 x = __raw_readl(addr);
			*buf++ = x;
		} while (--count);
	}
}


Thx,
-Vineet

> I see that the sparc version does the same thing, other ones without
> unaligned access (in particular armv5 and riscv) assume that the
> memory buffer is aligned. On alpha and parisc, there is an alignment
> check for insl()/outsl() but not readsl()/writesl(). I suspect this
> is not intentional.
>
> If they do run into this problem, they will fix it up with a slow
> fault handler on the unaligned memory access.
>
>        Arnd


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
