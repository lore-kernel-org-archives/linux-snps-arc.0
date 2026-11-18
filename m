Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E85606A885
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Nov 2026 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRXPK5EU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAmhAhLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RtUeDl4hSD5mXbbyuEKKd0arhl/X0WrsJ5s7QNlq9KU=; b=CRXPK5EUArWrO4J7njIyVHqQBx
	VsEXDcY939WXY1of9V8trgSi8R68RPGfaEtUDlg8sq9TcvQVPJGYeFG+5ik2Zx1vWpFBGcm/vTdax
	/uM7LlAhWhhRqlsDSY8rgH1j6yNfqN6Ae4Sj0zl7mT5Eja4o0pDvHul+NxKiwR0oql8SILn8E9j6u
	i4MRW6qLYszBuRg33lJmXHo9qwtvVY0eaz5HhMBCRuI5rf1tqEf/n36RrE0WfwvlQPEl2wrkwuu1X
	kwqLKjgC/37yF30y+oTT4WRybTDHiew0W5KkV6xXAFG2RS7RIO5UBhb/Q4/oFJDTmV2La+qxIFeoE
	g7W0zbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVbn-00000007Y7u-1AP8;
	Wed, 18 Nov 2026 02:41:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVbm-00000007Y7o-2I9O
	for linux-snps-arc@lists.infradead.org;
	Wed, 18 Nov 2026 02:41:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12EF2450C4;
	Wed, 18 Nov 2026 02:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64881F000C5;
	Wed, 18 Nov 2026 02:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969674;
	bh=YMqOGT3MjcC3nQRptIcEAaa3EXNPCJFAg8JEY31Ow8Y=;
	h=Date:From:To:Cc:Subject;
	b=AAmhAhLlRnDDMtI8DH9jmgWbXXRQSTjtRUmNzcbv+N4joGbc1CsAW219IlF0dF+uS
	 2TSTLQQfGFm4FvCGWFZemJtq6DRoqTJtkD1k2KDUindfzG2cIJ1oazO1/U8WnZs0/o
	 vcK8K7vhajrmJL+7VORWO7CJmfPlSTvHXh/kdRaAFSr626+gW5UMBD4jAogi5Ay+yq
	 N6OFlYCq8NC0MwoGve2EtyFig/Clk2bVl9f8avxNv/uiJQNW2qGgQ2L8ML4ZmUauX2
	 JCE1QDeWy7cOTO1/P9UvbCQAnXF/osN0NsHHifYT1TnRljBI8fotfMLwFmQoqkaS3I
	 1wttlk9cTcVrQ==
Message-ID: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
Date: Tue, 17 Nov 2026 18:41:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Michiel Derhaeg <michiel@derhaeg.be>
Subject: [GIT PULL] ARC fixes for 7.4
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTGludXMsCgpXb3JrYXJvdW5kIGZvciBhIGxvbmcgc3RhbmRpbmcgaXNzdWUgd2l0aCBBUkMs
IHBsZWFzZSBwdWxsICEKClRoeCwKLVZpbmVldAoKLS0tPgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDc0NzVlYThiNTg2MTZiMzNjMDRhZmI5NzZjZjBmYmFhZDlkZDYzZmI6Cgog
wqAgTGludXggNy40LXJjMiAoMjAyNi0xMS0wOCAxNjoyMjoyMCAtMDgwMCkKCmFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEvYXJjLmdpdC8gCnRhZ3MvYXJjLWZpeGVzLTcu
NAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDYwM2I0ZmQ2OWI0ZTc3NzcwNzYxZWEw
MzQ1MWUyMTY0MTg2Zjg1OTA6CgogwqAgQVJDOiBpbzogd29yayBhcm91bmQgR0NDIFBSMTI3NzE4
IGluIF9fcmF3X3dyaXRle3csbH0oKSAoMjAyNi0xMS0xMyAKMjE6MjE6MTMgLTA4MDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCkFSQyBmaXggZm9yIDcuNAoKIMKgLSB3b3JrYXJvdW5kIGEgR0NDIGJ1ZyB3aGljaCBoYXMg
YmVlbiBjYXVzaW5nIHVwc3RyZWFtIGJ1aWxkIGZhaWxzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClZpbmVldCBHdXB0YSAo
MSk6CiDCoCDCoCDCoCBBUkM6IGlvOiB3b3JrIGFyb3VuZCBHQ0MgUFIxMjc3MTggaW4gX19yYXdf
d3JpdGV7dyxsfSgpCgogwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9pby5oIHwgMTMgKysrKysrKysr
LS0tLQogwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
