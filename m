Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72352E7717F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVBrIBZ8gvWMrcvp1NVvQ/b4edT21BtQLFny9tXM2ak=; b=fu6UJlfC4L9BNf
	/18qTgZFKRcL4pN1T6/xwpVUboCKwR4BRH8y1JnogfdC/b2bKZ48UEqB4zCPtiSHRkLC1CK9KFb1J
	eYChZYcN523SEfd+ojr1PQW6cLZ4FTgHVbtPfSxaaKUIWv9x0ZjXn6UHEAqQ7SwKziq5GXccIhd3X
	qCZ/V8btRxl/TFmWcLaD+juzD0QYRduchoNASZEgHmm1KbNqA8TIMi7dnr0nLXdVcU/02iW/ZqAof
	94/YQIkjCGgUECe0G+HMeBcaoxFzoEqmMCpiXLS7WwGcBfSp6mLUgEIsX4QSJ2gKWw36icDG6MifD
	NJjW5GrJmI7a6Q7Q41sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM18j-000000036KZ-0fk0;
	Fri, 13 Dec 2024 08:35:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM18h-000000036JR-0hwk
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 08:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2DD85C5F33;
	Fri, 13 Dec 2024 08:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048BCC4CED0;
	Fri, 13 Dec 2024 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734078909;
	bh=QP1IcOeCvYcZ0atShD+bUuKM45SXUGPe32/BoheXswE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jT2prM+gHqgOY35eQxxtPZwHA84An0lqy+jJ4VjIx/MgK1xmiD1DupxMjf1BS03DE
	 jZKWiIDCMt1Dut/x6m5L9fRJeEudaFG0io8G3ncIqNeuSovHHU6r1ld8RMRlNvYDpa
	 xrevaMDxiqOpjSDNbOBuOR7Vzdc+lUvOs1EjKeGIVmo5CDYD8xMYam7fQYbJQZ4t5y
	 65QYPQFntmM6u8+bZMdZspFgP3N8nup2XcikiW16KkJNw/jEEdh3qWOP86QD6gwI1C
	 TDF9UTrcZ/Kf8aeh/E/rxyUESdoujS5qHrLHpERCndLqc6ZpUushFrg5pfoKhQ2Mp/
	 erc2nOq42tNsg==
From: Kalle Valo <kvalo@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Yafang Shao <laoar.shao@gmail.com>,  torvalds@linux-foundation.org,
  akpm@linux-foundation.org,  linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org,  x86@kernel.org,
  linux-snps-arc@lists.infradead.org,  linux-wireless@vger.kernel.org,
  intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
  nouveau@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
  ocfs2-devel@lists.linux.dev,  Steven Rostedt <rostedt@goodmis.org>,  Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,  Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Andy Whitcroft <apw@canonical.com>,  Joe
 Perches <joe@perches.com>,  Dwaipayan Ray <dwaipayanray1@gmail.com>,
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
References: <20241213054610.55843-1-laoar.shao@gmail.com>
	<20241213054610.55843-2-laoar.shao@gmail.com>
	<Z1vq2-V7vB5KhBR9@pathway.suse.cz>
Date: Fri, 13 Dec 2024 10:35:03 +0200
In-Reply-To: <Z1vq2-V7vB5KhBR9@pathway.suse.cz> (Petr Mladek's message of
	"Fri, 13 Dec 2024 09:05:47 +0100")
Message-ID: <87r06crnew.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_003511_252520_D1531EBE 
X-CRM114-Status: GOOD (  13.16  )
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

Petr Mladek <pmladek@suse.com> writes:

> On Fri 2024-12-13 13:46:04, Yafang Shao wrote:
>> Since the task->comm is guaranteed to be NUL-ternimated, we can print it
>> directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
>> where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
>> Name. With this abstraction, the user no longer needs to care about
>> retrieving task name.
>
> What is the advantage, please?
>
> Honestly, I believe that the meaning of
>
> 	printk("%s\n", task->comm);
>
> is much more clear than using a cryptic %pXYZ modifier:
>
> 	printk("%pTN\n", task);
>
>
> The %pXYZ modifiers makes sense only when the formatting of the printed
> information needs some processing. But this is a plain string.
> IMHO, it is not worth it. In fact, I believe that it is a
> counter productive.

I agree, it makes the code harder to read for someone who is not
familiar with all the %p magic we have (like me).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
