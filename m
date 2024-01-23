Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5473C46CD2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Jan 2024 00:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOjBIwBOFhhJ/17XZcohzwZAl89NxmgVMnk7GdpgCcc=; b=d2y4tPa+p7qwQw
	DeDQ9HBuprXLopZU4HjLAaOG6qCL8dKrOi8AEYoXeLBI4k+2nXTcVk5AasmOUn2CaKE6yzn3+Ul4b
	JS+WSQmWHCn6lM/M8RzUJFGa9obsPs5xJOqXDhP1l9L3a4s1wZWKA1mYCAPa3LlWpri5dtWlFN93V
	2ZKvxYB2ZNllThEPQBxI5jNl1dvRyitb8KmMpmBHTTyf4W/2M4rJBSIGezOK8Unuul6UdZAgzt6bQ
	rcpzR5TwyEKbW7TQAH/NlsXE51mRMqYls3bP9bXQOK00SecuXhR/hdX9+6o+/Lo1+yrodfWnYGyRz
	Yxk4Bwu+fdqsZmTwQdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS4lr-00Ec7l-0G;
	Tue, 23 Jan 2024 00:36:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS4lp-00Ec6A-05
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 Jan 2024 00:36:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d746ce7d13so13331735ad.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 Jan 2024 16:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705970163; x=1706574963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plGxjteRa5N+fIhm76KZZ2X9yyNuyI4/ZE1C443mi7c=;
        b=jlR1qBEBWyyWfuxX/6zrEKxm5woBv4OBG2WSDWVqatlDz2Km4rUx1SOrQ5XA2yxAMK
         ycDLAywp9V6GL5jWr0obgGfUt2cBEC61jvHjL1OPT5LHeANwwWanqHrras+GpqjQ+R25
         b/6WSshj38J339T+BpZNMVpjbzfUf+NltvSQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705970163; x=1706574963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plGxjteRa5N+fIhm76KZZ2X9yyNuyI4/ZE1C443mi7c=;
        b=YI2U6zBw8o33F0FZ8CW66VFWdihDL7qLZqwlDkg+WWxIj3MCNWvwrZpV+WtajV+NJv
         1Li8CvcUDUKcTR7TzIcZNKBAsNp2Vcr/ei9nm2Y23FsYsjDFhlNzJHYY0EEuT/cUOWrF
         dhMlyxhpP2NLLxaJFnni8OSCLHQeCBdSFHO8fhdXPcEDS3YNKBH3CQRHGzHJ65jRu7Eg
         yjRqbIcHhUW3X70qvFCDX6xATk1ek6bqIjzuNctylrGfa5YMnEAkdl9QPWVbnWrOqQHT
         vogEO1IKkjT7MjJYEBS5JKgZRfStprYhJk7ob3zAi6B2I5zBTAQpojqOL2sKhVMuZzYT
         W97w==
X-Gm-Message-State: AOJu0YzEfi+/CGwb/CwKBBI+MdDA2lhPUP2ttA0XgIU6VRfGE9+ubswD
	irV0LMC9+HZIazv1sdyqYB5AvsBgr1bpWI4bb1FRe2qpCGPYRwtIy10J+NlXdw==
X-Google-Smtp-Source: AGHT+IFKRKBK9VkrLk8Gvj2KGY6rQijWePcBEXl1QP0qD1UcdfCZ3HnRfHtBDMtyo6SzfYFYbeiiuA==
X-Received: by 2002:a17:902:b10e:b0:1d7:244e:906e with SMTP id q14-20020a170902b10e00b001d7244e906emr4823001plr.68.1705970162892;
        Mon, 22 Jan 2024 16:36:02 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b001d4593a2e8fsm7733952ple.83.2024.01.22.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 16:35:59 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"dean.yang_cp" <yangdianqing@yulong.com>,
	Song Liu <song@kernel.org>,
	Yihao Han <hanyihao@vivo.com>,
	linux-snps-arc@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 74/82] ARC: dw2 unwind: Refactor intentional wrap-around test
Date: Mon, 22 Jan 2024 16:27:49 -0800
Message-Id: <20240123002814.1396804-74-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=keescook@chromium.org;
 h=from:subject; bh=8xMicWCCIGnY5GKvzZPD3ZX2aaa2K5PDmR+v+tHiKy4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgLa43MyLCbPnS7rIKEr6C5f+3w+xjELlHCV
 wb92b59i9WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8ICwAKCRCJcvTf3G3A
 JrpAD/4xhn2HsV5zKKag0M7HS/9i28lHFY4IgZ7Sp/FXWqsjhJpe+6L8PIMzWEBAz92FxtyORdf
 VL+eitydi1OUF4wQn5MlkJ9CuYUuRkqygF2GNN2Yv1RxYn41vBvNCuYIauc6D5qu0qdxnnP6Md6
 84Wz30+PNpfqG+4iMSiroUyKG54Rs5mizS1WG6YfWtx3YbaH1cN9/tF3YP8GRKMwDUUaO0a+eAN
 KE4rFgsPGobQpzzmomeGjLNzFgA1quKNvV0vj4JNIex/9cb4WYPOVEYFoSmbC7GKjxW+Feoh6sk
 OvDSN1cF+uHp0J/HNlCu9234++OHS3O99H6uPHVYrJAff5v2Y8xQIZOHQexnwz+XpjOzwRTEaMg
 AaQwsD98zVWDntX4MOwBtxsAygM2tc6IF7b0qZdHQy3UdlFBRbUiOVa9hOnRJxYLVRxmfZofKAF
 FszP40YEw5lDzaprhTGytbpNvVCQmqppB3GhHMQrCBA6irAcVze8V7JWHb/QOfsXzW1dfZ+wm6b
 JqEyk+UA0/YDj29GWvTQ3Eyx1i2tZ6p1xL3sR0USkZszG+zbF2E1aaV1tNGWKi8AysZfjkgMMaP
 3hABbeKJFLwRLimh1GaqkDPDGG7vbdgQYbJVljd6TndE+Vys1auQJU6Hdc2dM0CmHHDf3UNBzRC hw1N/vlLdn0dvOw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_163605_063627_BF12BDD5 
X-CRM114-Status: GOOD (  13.24  )
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

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded wrap-around addition test to use add_would_overflow().
This paves the way to enabling the wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: "dean.yang_cp" <yangdianqing@yulong.com>
Cc: Song Liu <song@kernel.org>
Cc: Yihao Han <hanyihao@vivo.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arc/kernel/unwind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 8924fa2a8f29..649b56204580 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -1278,7 +1278,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 			if ((state.regs[i].value * state.dataAlign)
 			    % sizeof(unsigned long)
 			    || addr < startLoc
-			    || addr + sizeof(unsigned long) < addr
+			    || add_would_overflow(addr, sizeof(unsigned long))
 			    || addr + sizeof(unsigned long) > endLoc)
 					return -EIO;
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
