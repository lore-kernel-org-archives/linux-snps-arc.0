Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EAEC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Mar 2022 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=edBz41xXUkxrxVs8dsdC4AFvqSWAxgnXtYHlDLLiHhs=; b=0ZubLxCHBLtksH
	L+kEe5U+lH4CwGSj2hG0ZxT4PYOfGvBfZ7PB/bpFcooeFjWKcv7fh6BUsVKI+opq/F0Run7mnQ84F
	eDUhszacb7swtkOHPb6QCzoZCjqNpjz+3VRwEd859BcNxXAPJZId00zpo+ZzMyptZiAsCkmFFWiC3
	mDJTNFXGHYvGa+0Z/HMQqNvJwXGzsMqosrXLcfGhGhi3FR93jC4JbN/d5IYJZTuyAop5Q1Bnn+C4c
	Yk/3SsyuDfGRBoVES7sTyNWrULrpxtJZHIfZx7j+aBXbs22dqUPR5qlTn0YnxhCMjIoi7ZODLlh37
	QKTq/kejP4JC5g/gJ/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVED-003GT0-EG; Tue, 08 Mar 2022 08:29:57 +0000
Received: from mail.twelvesign.pl ([89.221.214.137])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVEA-003GJd-4D
 for linux-snps-arc@lists.infradead.org; Tue, 08 Mar 2022 08:29:55 +0000
Received: by mail.twelvesign.pl (Postfix, from userid 1002)
 id A200435771; Tue,  8 Mar 2022 09:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=twelvesign.pl;
 s=mail; t=1646728167;
 bh=rqcEvVJQSOmVvt10Vd77A7h4EQ3zL1XaGAodpexDxk8=;
 h=Date:From:To:Subject:From;
 b=KyKGIee8Fa+19QrL9symnmEBushObWQbU+dDafRcCm5AUww+C3YEwlT9+qB6NWn17
 HURZhheYk0ny2VkpHoj3cJRePCoSQ0tqLFW9/OS6ym+9KLv1fKhQ0V9fEPnRg5kfsN
 kJnejNB9BqKwjDIPlTNnlZfvPRGKwyhjgvhdRW/aj1QAoIlNxf5iU44IIIeaN6KRer
 0d3xoGvHNEU0pA1pSdEHgEPNCGnTpsK7W4IWeaN51Ju+lMxN8MM7bo/ziJZY0kn204
 U3u4bs9vh+/nRrWOYfq7ffeKssOpjjFHianlWmUvqahlLUKWW10wrYlg5gJvUfz4BV
 Z2A/KkTzff/5Q==
Received: by mail.twelvesign.pl for <linux-snps-arc@lists.infradead.org>;
 Tue,  8 Mar 2022 08:29:05 GMT
Message-ID: <20220308083000-0.1.w.1uxe.0.va4jmb2lc5@twelvesign.pl>
Date: Tue,  8 Mar 2022 08:29:05 GMT
From: "Damian Kraska" <damian.kraska@twelvesign.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.twelvesign.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_002954_407475_2F7D6745 
X-CRM114-Status: UNSURE (   1.25  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkRhbWlhbiBLcmFz
a2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
