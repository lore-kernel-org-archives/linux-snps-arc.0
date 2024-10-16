Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CD7D2069A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zD8AQV5b3EgdKTU6HtGluHeqFnplW3kQ9JHvkN6qT/0=; b=bn8whSqLmCqsr3
	cUoxHMlK+dWQtXyZtzD3ot1Z2tQvA3kHOkj8E+cNjx4qhe063bPFiET9UGkr5pp6wADUt9vb/dsFG
	JMKobKZRP7klyBMEvyLo0nAMTJnBhD9n7+i7Bk07wb5iDapArRcbM+5RhGPTOEgNSz7sHc7ZNMH3u
	IsKoayZtJH8OjUu+m5rbDh4LWYmq+ewFj0Hd9hzg4n/qbGoDtYBXOUdY3hP+2VlG3/Lhowm1jq9IM
	sWtoHcwSWffFbYVOD9DHfhzHyJiXosdONeelOn7DfM8prSHkG1Tftc7yd0W9PHEq56PL2nIj43c5x
	PCTAH5ydlQGdNvhEQT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZj-0000000AZMy-0oqN;
	Wed, 16 Oct 2024 05:27:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZg-0000000AZLS-2mr7
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D02B1A4293B
	for <linux-snps-arc@lists.infradead.org>; Wed, 16 Oct 2024 05:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22623C4CEC5;
	Wed, 16 Oct 2024 05:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729056475;
	bh=k/9QINLSbdSjYGrTTg5WRlQWOp49gEYmT3PRfFhXFD4=;
	h=From:To:Cc:Subject:Date:From;
	b=nz/IpAonenIaXRj+4TWKuXrAb57EJQi+QOtzqQD2G/38WyjXq5VK6xJ6nWH+J7Sdd
	 MEfkX09gLyZaxvz8tVheHl9cafN7msMO/rog9KhGVEbwPAKjGP3uDJe2SmCyE/uQmz
	 pbK8Zk2bibUwX7OoV+CwOKqOiHJ9XURABPV5KHbDI2Wr6NQpFNp4YduMmth68KwXCr
	 JyfLmGTB3itlc6G1ErbdtBBQAyPFvleQnUQHhOXDuugTfFdtilNX+jSnerh5ITjn8s
	 Bv1H/SgG/0j8WRNDCE4v109BkOyaU2asICX/+acIrftHF7vuDXqlcfipLqFcaqwYt2
	 WCvNCX6ndXBRg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/3] ARC fixes for 6.12
Date: Tue, 15 Oct 2024 22:27:46 -0700
Message-ID: <20241016052749.1640081-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_222756_788981_59EA9745 
X-CRM114-Status: UNSURE (   6.94  )
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

SGksCgpDaGFuZ2VzIHNsYXRlZCBmb3IgYSBuZWFyIGZ1dHVyZSByYy4KClRoeCwKLVZpbmVldAoK
QmVuamFtaW4gU3rFkWtlICgxKToKICBhcmM6IHJlbmFtZSBhdXguaCB0byBhcmNfYXV4LmgKClBh
dWwgRS4gTWNLZW5uZXkgKDEpOgogIEFSQzogYnVpbGQ6IFVzZSBfX2ZvcmNlIHRvIHN1cHByZXNz
IHBlci1DUFUgY21weGNoZyB3YXJuaW5ncwoKVmluZWV0IEd1cHRhICgxKToKICBBUkM6IGJ1aWxk
OiBkaXNhbGxvdyBpbnZhbGlkIFBBRTQwICsgNEsgcGFnZSBjb25maWcKCiBhcmNoL2FyYy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGFyY2gvYXJjL2luY2x1ZGUvYXNtL2Fy
Y3JlZ3MuaCAgICAgICB8IDIgKy0KIGFyY2gvYXJjL2luY2x1ZGUvYXNtL2NtcHhjaGcuaCAgICAg
ICB8IDIgKy0KIGFyY2gvYXJjL2luY2x1ZGUvYXNtL21tdS1hcmN2Mi5oICAgICB8IDIgKy0KIGlu
Y2x1ZGUvc29jL2FyYy97YXV4LmggPT4gYXJjX2F1eC5ofSB8IDAKIGluY2x1ZGUvc29jL2FyYy9t
Y2lwLmggICAgICAgICAgICAgICB8IDIgKy0KIGluY2x1ZGUvc29jL2FyYy90aW1lcnMuaCAgICAg
ICAgICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQogcmVuYW1lIGluY2x1ZGUvc29jL2FyYy97YXV4LmggPT4gYXJjX2F1eC5ofSAoMTAw
JSkKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
