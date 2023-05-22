Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C1BC7EE2D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TVDrD93DqccP2iKVCej8LqXr35UeDivlhIOeflnKj4=; b=qrwM6LNV2hpUu/
	ah1WFHr9fyc6Tse07pZFCUF8MxbL63Mo3pvXPD3subj86CwEFm0lURgTHia9b25jJztCP7PvL8CKZ
	7Wkvhmv5vaBslgiDv1cHSXvNt00HLzXAfcCfwX04gk5a3Xf8CThmaa6ZMIitVUGOoafwsrN8Bthln
	hY7zlUfIDxMBJ+LNKBD1Kchqg50Jz2mxYqkGoF8jD0KmqlIe2qidMFtm+t1Lk6xK5pDvcOYu4jB9Q
	KSZfp7rUGO6s+3vUycKuEnm7ESs45lqyzv5JdxDo47/D1SAZPyoUBh+/vKekzyMV+qs/AcUgcAQ5T
	1Y2NXrdPlaDHibidn6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXg-005ZXq-01;
	Mon, 22 May 2023 07:01:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXL-005ZMj-2S
	for linux-snps-arc@bombadil.infradead.org;
	Mon, 22 May 2023 07:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AahUWbcM1gd1dIKV3ajpbH14PSzhJ7702+mo4mqS4bw=; b=cx4WdXZ0PcfAkPUiWuJ8pkO2hr
	Rq/cqLf76AO5Y38HDw4Y/4lWWuBI4nqk01LO6U8mrjYlzOgwKwgDUG2cL10jikNCKJS0qnh5Z+WHg
	zz5PsBcAuWF9fH8VAp3t+2mA5JKFSnexvLk1Fnv34AP+UQvl/hamOw9NseMR/Q+6C8XonssjqRXJU
	gE//Dhs5KED4fPmI8gRmni3OpRop8O0ozQLbVwLUfek93YZW0rq9H9XPvnedvYipTqyzuYgk6t3yo
	92JiRsyCgLayol0Fuft0Za71qjd8ukUNKVBED2+gXkaqYbMpKu3mCUUswC7Pk+HG8tp6ilZZByB12
	ZoUpGthA==;
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXD-001xbl-1w
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:54 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af29e51722so29528401fa.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738845; x=1687330845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AahUWbcM1gd1dIKV3ajpbH14PSzhJ7702+mo4mqS4bw=;
        b=BOx3hh3zVFySbprqCFUQMf+fnYuA2iUWep9gxTTyP5WeKKesv2gkIt/oZ6gEvNuPqI
         gsjbEjKEDWqEmE5Xz+Nt/ksrroHKs3LUAOgWVbkRN1Kydxt9EKFhkr8TpfFEhu56yyMK
         Fi4/TilXApxKBTJwYVjZxj/UXLWFIj9+4VoHAGULRBmHb3Zda8kO4YxVCQ0d2N/ryL0/
         trIrcEVfvwtXA0iflvfhHsiTC15IrKKRjozmZ4AWsaglSOB7UzCOIdwM2j6Z++exTmfV
         E97bpCK0CgHzzii3nCIaFh8KtL2mBA+CmhLDuwxHMJPOnCXsxBPehRvCb+Dc2MeynGDJ
         h1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738845; x=1687330845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AahUWbcM1gd1dIKV3ajpbH14PSzhJ7702+mo4mqS4bw=;
        b=BX+O3pSgTlkSUQZCbKn/oK2hdLhtaYwIbh5dyDoALSdpWPVnKw51l1AMKGDJgTpPMg
         xAfRJf6P2szpH10La19dSeDsjkKZkj8fHQcjQijHnzTEfuSMuO0CEzRRUYlsIA/67/Yu
         5FTj/cUNnuxd6rp0CNK0+rHPlMYpxpSJUHzVlUCdHEmudVhhEOfCBXnicozuvclpN+Mf
         AQSnpAgk9WG2wiR+VXYBvvxJZ41NICMs4yggTgy08OAszOA0mP8piMx4EQp/Nc8oawIS
         6zJ3opLGl9Z0/yW8sqN1W6SAAfao3efw371jfnat35Ogwf42dNf+ezefQMtrXkt0gkBH
         O3gw==
X-Gm-Message-State: AC+VfDwCowoLiKh/Daa4INclSGg08jFDVgM3RIZVOB9HDJp5Pcu2/7Ky
	V0fkGiMftBCbeWvCTIpXnIExPA==
X-Google-Smtp-Source: ACHHUZ42e7ChwDWtOUUn4J77SbnYxbJJldABpTKqJYmVMK67oK/aQaDrAhMQZ3FMLOrwg7jn9I7vUw==
X-Received: by 2002:a2e:81d1:0:b0:2a7:a719:5943 with SMTP id s17-20020a2e81d1000000b002a7a7195943mr3785908ljg.40.1684738844861;
        Mon, 22 May 2023 00:00:44 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:41 +0200
Subject: [PATCH v2 06/12] cifs: Pass a pointer to virt_to_page() in
 cifsglob
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-6-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
 linux-arch@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Tom Talpey <tom@talpey.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_080052_805508_B46DA2C4 
X-CRM114-Status: GOOD (  12.31  )
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

Like the other calls in this function virt_to_page() expects
a pointer, not an integer.

However since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up with an explicit cast.

Acked-by: Tom Talpey <tom@talpey.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/cifs/cifsglob.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 414685c5d530..3d29a4bbbc40 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -2218,7 +2218,7 @@ static inline void cifs_sg_set_buf(struct sg_table *sgtable,
 		} while (buflen);
 	} else {
 		sg_set_page(&sgtable->sgl[sgtable->nents++],
-			    virt_to_page(addr), buflen, off);
+			    virt_to_page((void *)addr), buflen, off);
 	}
 }
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
