Return-Path: <SRS0=0uDb=ES=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFD3C55ABD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Nov 2020 11:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC18922201
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Nov 2020 11:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrCbu+De";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zZ3ortjp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IHlNPa7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC18922201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BaPqlFjF+wF+ZMwykEAKZ28scKt4DD+kb8c46yYEp1E=; b=jrCbu+DeM3umjeB4yiky6EmOD
	rNET5qCUMgwu+XGuMIq0dg6o51medF1IbJ/RbYnLbzWE9M1YuRA5MDI4u7KcDIFMJv/jLGNAuA92R
	ooK0SH1ZmPl88R7ud4AtGaIZ2ZvOzYkUt8+fvRP0OgleN0mBm/3Wgm/3yavDlU6Cj5MWhLdipvU1v
	CaqjDAIwlAgwntfQnopACqsqkmhZZ5NVwroOi41OGNUMh0boOV4832FPQXN04URXyqJjSx8QvoiXu
	Er8kfQJXYsca7oGaRR0AOFUGeBg6ZYSuAXCzlcFK2svhSAS1CQg2fkyLg2+ndfT9UoXkXflUkqBhE
	61skOty8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdAS5-0001rR-Uv; Thu, 12 Nov 2020 11:07:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdARy-0001oo-4w; Thu, 12 Nov 2020 11:07:35 +0000
Date: Thu, 12 Nov 2020 12:07:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605179252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GScfsa8nOXUlNCCC/0bnPZszGImDlkAqoVu5Twbqets=;
 b=zZ3ortjpGyVdT6l5Epo+oXEihOo3YsbgeWmCO4SNBn297T52hhepV9lm5suD/944+Sz1gu
 BkYylnk8pMKlYkb4csofMkEGSrhcQcyIn5AL1i1pw3/utYozF/zdo6+bRfmnph5PP7xve1
 PpOVvXxebOQE5U3JtIzNhA0Fc1104xhNai+afx4A4y2O3Fs5x58WbqWTdn5gkAWgcM/duh
 sMgxr+wPIZY9f8FrD3RrbmLqGk62lK9VfUOJuVBmyG+rJup0NYxJRRrKBRd/enHEx2zhIx
 UfbLWY8NE5CqXAlPHU3T/T5B/66csi1W6K2Uz4Y5UeWB8lzg0bfoVIlYejlz5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605179252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GScfsa8nOXUlNCCC/0bnPZszGImDlkAqoVu5Twbqets=;
 b=IHlNPa7GPp5Ilh/x3NSZBuxoBCag1CyU3lSY94fXEHyvLJqz7JXMYGP0aqsiN8HGB3WFr5
 ZFMQ/3qvo+nJiyAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
Message-ID: <20201112110729.vx4xebavy6gpzuef@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
 <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_060734_397152_2D802013 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Mel Gorman <mgorman@suse.de>, Dave Airlie <airlied@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christian Koenig <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2020-11-12 09:10:34 [+0100], Marek Szyprowski wrote:
> I can do more tests to help fixing this issue. Just let me know what to do.

-> https://lkml.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Sebastian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
