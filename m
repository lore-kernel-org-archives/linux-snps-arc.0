Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60870C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:31:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF14206F9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2I1EUyq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MV+1er3Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mx7qMaUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF14206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjSWHi6iqzOqVZDlN5H2FOnvywmMgTfBpzcy/ujssps=; b=J2I1EUyqHNZd8+
	bq7KJfElMYWceGZcrF0xQ8KL1JTFrvM/H/JryDIUmPaveTqhg7+7Bg55vNJ1rWZqbK6hVDcQo/PzU
	GVNLRCmK/D9sx4/9pt1gTSG89AWEUkpF7tQpnWaXenwZlaGayj9Ueg0KJ3Q0LWE/aRIrYw6RLZEqt
	4J82xXZkc4LlzgQo5W4hK+bZRkk+EKawYxr54rh/yt8lnexlHyTU2/aW4Q0pWBiGv7WggB5Q3Ejpr
	OPH27WPcA0jHc8LxrDncNAm29P/cqvi3xBddyhXjI3fXX7Dg26t4P9IlzyKQt5JCjWoO6HAYWN8Rz
	qfsGYIOjAlEm/NZL/Esg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPaRn-00085a-LE; Fri, 17 Apr 2020 23:30:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPaRl-00084X-F0
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:30:58 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ADE8BC033E;
 Fri, 17 Apr 2020 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587166254; bh=48TH+xxXfQrpjBQEz+VhHKSRpQVV9wwZQLVDHbhHqC4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MV+1er3YNvu/XpQrGArF4FPaHscRSCYQPjb086aPPUlSP+NBvM+G1Sov6nHwlM6hF
 Vm74i5RKpez0YfDsYu0V/rzbuiluGHh5apnpkHtF6Zqt1lAA6IVPAJxiVW8zLrLApQ
 U85o4w6vzh/ZqdkVzsHoFi8+K3F9916DisHqF92uqRG/S3GBGyZXSMk/HTlzTMDMlL
 34sWt7/9+iHl88krBKk8FXcdQUB5/5ZZcwm3inx8Z0MsYqMfw2QdAe022r5W2nzm+m
 qsRFkn7lb1zR18SAntv1GhQMkH+K7ns6RJq7C914HP2KzTfTSr5LQjIq/K0sHy4H2Z
 dPnJeWy1+E5bA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id AB85AA0067;
 Fri, 17 Apr 2020 23:30:43 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 16:30:31 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 16:30:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBDOvurSWxP3QJaOBf3vtTufaeIyuONu+ipdJCHZQg5hDWhFUrpZB97Z+mzbnbTYu8ReRWuO+FBLuK+IHGgkPVmvmvTUY2p3WkTVyfySFyOKb7Rh+Dgl/PIHcw23uuXQxBCy0e1BtlAvxGErt4a7+ul+s01ypEwkcgdscXXzlyJpqGEdHPsqC1W90AiksrVA3xgqpWW7/hsPj4igPoxta/s4GmFpLcoJ8ALF6uNIpdfHG8QiEnVcS1G+Xnq07slKSgtkxnrmSEgc6n/9etCbKPJsSjpixICEgHtB7Cr7cloubg/oK+yU+t7O+4HP+W6gCU44JMhiwwxTjZlm5QWs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48TH+xxXfQrpjBQEz+VhHKSRpQVV9wwZQLVDHbhHqC4=;
 b=SWper/8UzwgaR1hySg4y8j0lMeHPpx0toDOXioBZw5ea+eeQRSjsTQ52us2xkCFd4tIIrVgCDjCSPJmaLGJKoZ2/E5DIlL4RV75EbRcE6EEwQoNVTkpwCBDIlaWMRkBsNsxwLSO8qhv0uOg2Mdrxg0lmDSPJGuiV5sateEByDsBJd1MhX/OCfi3iAMjFQ03SAFSfbRaM7MqvJFDOtmS04bGIU3ykM3zD3m+jYU5ywfiNzbqMp7OpzpoAMymwiCpPHJyvynf7cFt2d1oREBD9ryrcit1i7dsB+Q6J4ajO6x+JLf/v1npYpRNybPH0bF5GjLFopcj1LDGFcCJh7UapHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48TH+xxXfQrpjBQEz+VhHKSRpQVV9wwZQLVDHbhHqC4=;
 b=mx7qMaUNB+Q8SY3+6Ks/8G6fCQ0kbQXPOCIHM5L2KkXftHlWPNzDEMKi7Tgmy0liIt/3kxADNkpZuOwIGlRldevr2aGcEXJt9r9um9hCpE2nQSE/fGXxkhwcLVflaEwl75EnKszpotcZduxI3SO/qBPLIFXh2VbOf8hSAZcYRls=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2598.namprd12.prod.outlook.com (2603:10b6:a03:6a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Fri, 17 Apr
 2020 23:30:29 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 23:30:29 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v5 01/14] ARC: ABI Implementation
Thread-Topic: [PATCH v5 01/14] ARC: ABI Implementation
Thread-Index: AQHWDhqNPVLJmlktx0CpJqjaCwVsXKh99WuAgAAOugA=
Date: Fri, 17 Apr 2020 23:30:28 +0000
Message-ID: <29e89b2c-3853-f3bf-bd28-f93a3b17ca03@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-2-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172234560.1082@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2004172234560.1082@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:c8eb:6ba1:57d7:7e16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a048733e-9548-46af-8080-08d7e3275081
x-ms-traffictypediagnostic: BYAPR12MB2598:
x-microsoft-antispam-prvs: <BYAPR12MB2598E06917183852DB8D3523B6D90@BYAPR12MB2598.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(6506007)(2616005)(6486002)(36756003)(31686004)(6916009)(186003)(8936002)(53546011)(71200400001)(5660300002)(478600001)(2906002)(4326008)(8676002)(64756008)(66446008)(66476007)(66946007)(76116006)(31696002)(66556008)(6512007)(86362001)(316002)(54906003)(81156014);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RY9nVKXwbGuYF7gSTMJeb5SPcXh8PVi1WDCO7Kgu7Q7sZs7v/1V3iXkxwZS1aj+/Lo8DcNduARq6rLT8QcXwOzNvybQBM3G4HdvjYm+b4VEVO+LoBEAwIP0t3+e8lP2ltUFxC6Zj7WvqUPqisMd+Og4cerrNcOCp4w1z5E9Yux1sDkHdAZ4OdlPccK4PpUEj6YgIw6O6WiBqr6/PxBggdmMwz53/DO7c6tayyaLIgyS4bCz7E5GaGWw3vyk3IGWhhXJaEjA/PJp3V0svXia1j4lY4rMNohqNAqFPnCNug2TPOP9CIj9A20e0KBCe/JXS7DlqKLE4NHWErh8hmIu0GibBVU0qy7mLQVCkaCWNmDp7szMzJHP1LxYdb2wXlT9eRFIhvgCIpKgyZSxcQ5JqlFTP+3Dvt2O5qaa99FA+1YTFCgqlfVBisvyaq3l/S3PV
x-ms-exchange-antispam-messagedata: oQfokIVMcu6wKIzHmqO5lvXs+KSLVfwdUnytM5xw2n/6u8WTDhYdeU8dFE7gEt7aWnZWcUXUWSZH5ydIuG4Rf3XKL+Ww8zwOXN01mT9df8Lk8rBpliAaIE6T6880XgmxwswdC2zfoE7beXNvfdklZ+AwtJLeFtzszYgzzHtT0QGnJVEsmEkf56nwJTStJu1a1LQiBIPhwQntIvKtoCN0Lw==
x-ms-exchange-transport-forked: True
Content-ID: <6B4C98DBCEAEA241AF184C397FAAA6E4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a048733e-9548-46af-8080-08d7e3275081
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 23:30:28.8629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZ52XqO8hk0lI0/MztFR0vMJSg89L3s9zOWDFJSQI63XTxdnqiiyqLHcWT76GTau+iiagY/F1ryBuy/nk72oBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2598
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_163057_646535_38A7C57A 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/17/20 3:37 PM, Joseph Myers wrote:
> On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +#define reloc_index						\
>> +({								\
>> +  unsigned long int plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
>> +  unsigned long int pltn = reloc_arg;				\
>> +  /* Exclude PLT0 and PLT1.  */					\
>> +  unsigned long int idx = ((pltn - plt0) / 16 ) - 2;		\
> 
> There's a stray space between '16' and ')' here.

Fixed.


>> +/* Helper for generic ____longjmp_chk().  */
>> +#define JB_FRAME_ADDRESS(buf) ((void *) (unsigned long int) (buf[JB_SP]))
> 
> This comment should not use '()' (see the GNU Coding Standards, '()' 
> should not be appended to a function name to indicate that it's a 
> function, only to indicate a function call with no arguments).

Fixed.


>> +  __mcount_internal ((unsigned long int) frompc,			\
>> +		     (unsigned long int) __builtin_return_address(0));	\
> 
> Missing space before '(' in call to __builtin_return_address.

Fixed.


>> +#define TLS_LE(x)					\
>> +  ({ int *__result;					\
>> +     void *tp = __builtin_thread_pointer();		\
>> +     __asm__ ("add %0, %1, @" #x "@tpoff   \n"		\
>> +	  : "=r" (__result) : "r"(tp));	        	\
>> +     __result; })
>> +
>> +#define TLS_IE(x)					\
>> +  ({ int *__result;					\
>> +     void *tp = __builtin_thread_pointer();		\
>> +     __asm__ ("ld %0, [pcl, @" #x "@tlsie]      \n"     \
>> +	  "add %0, %1, %0                       \n"	\
>> +	  : "=&r" (__result) : "r" (tp));		\
>> +     __result; })
> 
> Missing spaces before '(' in calls to __builtin_thread_pointer.

Fixed.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
